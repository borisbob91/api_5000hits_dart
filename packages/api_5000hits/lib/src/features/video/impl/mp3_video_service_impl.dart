import '../mp3_video.dart';
import '../mp3_video_local_repository.dart';
import '../mp3_video_remote_repository.dart';
import '../mp3_video_service.dart';

class Mp3VideoServiceImpl implements Mp3VideoService {
  final Mp3VideoLocalRepository _localRepository;
  final Mp3VideoRemoteRepository _remoteRepository;
  int _currentOffset = 0;
  bool _hasMoreData = true;
  static const int _batchSize = 100;

  Mp3VideoServiceImpl(this._localRepository, this._remoteRepository);

  @override
  Future<void> initialize() async {
    await _fetchAndStoreVideos();
  }

  @override
  Future<List<Mp3Video>> getNextPage() async {
    final localVideos = await _localRepository.getAllVideos(page: _currentOffset ~/ 20);
    if (localVideos.length < 20 && _hasMoreData) {
      await _fetchAndStoreVideos();
      return _localRepository.getAllVideos(page: _currentOffset ~/ 20);
    }
    _currentOffset += localVideos.length;
    return localVideos;
  }

  @override
  void resetPagination() {
    _currentOffset = 0;
  }

  @override
  Future<bool> hasMore() async {
    return _hasMoreData || await _localRepository.getAllVideos(page: _currentOffset ~/ 20 + 1) != null;
  }

  @override
  Future<List<Mp3Video>> searchVideos(String query, {int limit = 20, int offset = 0}) async {
    var localResults = await _localRepository.searchVideos(query, page: offset ~/ limit, pageSize: limit);
    if (localResults.length < limit) {
      final remoteResults = await _remoteRepository.searchVideos(query, limit: limit, offset: offset);
      await _localRepository.saveVideos(remoteResults);
      localResults = await _localRepository.searchVideos(query, page: offset ~/ limit, pageSize: limit);
    }
    return localResults;
  }

  @override
  Future<Mp3Video?> getVideoByYtId(String ytId) async {
    var video = await _localRepository.getVideoByYtId(ytId);
    if (video == null) {
      video = await _remoteRepository.getVideoByYtId(ytId);
      if (video != null) {
        await _localRepository.saveOrUpdateVideo(video);
      }
    }
    return video;
  }

  @override
  Future<List<Mp3Video>> getPopularVideos({int limit = 20, int offset = 0}) async {
    var localResults = await _localRepository.getAllVideos(page: offset ~/ limit, pageSize: limit);
    localResults.sort((a, b) => b.views!.compareTo(a.views!));
    if (localResults.length < limit) {
      final remoteResults = await _remoteRepository.getPopularVideos(limit: limit, offset: offset);
      await _localRepository.saveVideos(remoteResults);
      localResults = await _localRepository.getAllVideos(page: offset ~/ limit, pageSize: limit);
      localResults.sort((a, b) => b.views!.compareTo(a.views!));
    }
    return localResults.take(limit).toList();
  }

  @override
  Future<List<Mp3Video>> getRecentVideos({int limit = 20, int offset = 0}) async {
    var localResults = await _localRepository.getAllVideos(page: offset ~/ limit, pageSize: limit);
    localResults.sort((a, b) => b.added!.compareTo(a.added!));
    if (localResults.length < limit) {
      final remoteResults = await _remoteRepository.getRecentVideos(limit: limit, offset: offset);
      await _localRepository.saveVideos(remoteResults);
      localResults = await _localRepository.getAllVideos(page: offset ~/ limit, pageSize: limit);
      localResults.sort((a, b) => b.added!.compareTo(a.added!));
    }
    return localResults.take(limit).toList();
  }

  @override
  Future<void> syncData() async {
    final remoteVideos = await _remoteRepository.fetchVideos(limit: _batchSize, offset: 0);
    await _localRepository.saveVideos(remoteVideos);
  }

  @override
  Future<void> clearCache() async {
    await _localRepository.deleteAllVideos();
    resetPagination();
    _hasMoreData = true;
  }

  @override
  Future<bool> needsUpdate() async {
    return await _localRepository.getAllVideos(pageSize: 1) == null;
  }

  @override
  Future<void> preloadCache() async {
    await clearCache();
    await _fetchAndStoreVideos();
  }

  @override
  Future<Mp3Video?> getVideoTrack(int videoId) async {
    final musicId = await _localRepository.getVideoMusic(videoId);
    if (musicId != -1) {
      return await getVideoByYtId(musicId.toString());
    } else {
      final remoteMusicId = await _remoteRepository.getVideoMusic(videoId);
      if (remoteMusicId != -1) {
        final video = await _remoteRepository.getVideoByYtId(remoteMusicId.toString());
        await _localRepository.saveOrUpdateVideo(video);
        return video;
      }
    }
    return null;
  }

  Future<void> _fetchAndStoreVideos() async {
    final remoteVideos = await _remoteRepository.fetchVideos(limit: _batchSize, offset: _currentOffset);
    await _localRepository.saveVideos(remoteVideos);
    _currentOffset += remoteVideos.length;
    _hasMoreData = remoteVideos.length == _batchSize;
  }
  
}