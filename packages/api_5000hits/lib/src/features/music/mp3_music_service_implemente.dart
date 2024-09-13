import 'mp3_music.dart';
import 'mp3_music_local_repository_interface.dart';
import 'mp3_music_remote_interface.dart';

part 'mp3_music_service_interface.dart';

class Mp3MusicServiceImplemente implements Mp3MusicServiceInterface {
  final Mp3MusicLocalRepositoryInterface _localRepository;
  final Mp3MusicRemoteRepositoryInterface _remoteRepository;
  
  int _currentOffset = 0;
  bool _hasMoreData = true;
  static const int _batchSize = 100;
  static const int _pageSize = 20;

  Mp3MusicServiceImplemente(this._localRepository, this._remoteRepository);

  @override
  Future<void> initialize() async {
    await _fetchAndStoreMusic();
  }

  @override
  Future<List<Mp3Music>> getNextPage() async {
    final localMusic = await _localRepository.getMusicByPage(page: _currentOffset ~/ _pageSize, pageSize: _pageSize);
    
    if (localMusic.length < _pageSize && _hasMoreData) {
      await _fetchAndStoreMusic();
      return _localRepository.getMusicByPage(page: _currentOffset ~/ _pageSize, pageSize: _pageSize);
    }
    
    _currentOffset += localMusic.length;
    return localMusic;
  }

  @override
  void resetPagination() {
    _currentOffset = 0;
  }

  @override
  Future<bool> hasMore() async {
    return _hasMoreData || await _localRepository.countMusic() > _currentOffset;
  }

  @override
  Future<List<Mp3Music>> searchMusic(String query, {int limit = 20, int offset = 0}) async {
    var localResults = await _localRepository.searchMusic(query, page: offset ~/ limit, pageSize: limit);
    if (localResults.length < limit) {
      final remoteResults = await _remoteRepository.searchMusic(query, limit: limit, offset: offset);
      await _localRepository.saveMusics(remoteResults);
      localResults = await _localRepository.searchMusic(query, page: offset ~/ limit, pageSize: limit);
    }
    return localResults;
  }

  @override
  Future<Mp3Music?> getMusicBySlug(String slug) async {
    var music = await _localRepository.getMusicBySlug(slug);
    if (music == null) {
      music = await _remoteRepository.getMusicBySlug(slug);
      await _localRepository.saveOrUpdateMusic(music);
        }
    return music;
  }

  @override
  Future<List<Mp3Music>> getPopularMusic({int limit = 20, int offset = 0}) async {
    var localResults = await _localRepository.getPopularMusic(page: offset ~/ limit, pageSize: limit);
    if (localResults.length < limit) {
      final remoteResults = await _remoteRepository.getPopularMusic(limit: limit, offset: offset);
      await _localRepository.saveMusics(remoteResults);
      localResults = await _localRepository.getPopularMusic(page: offset ~/ limit, pageSize: limit);
    }
    return localResults;
  }

  @override
  Future<List<Mp3Music>> getRecentMusic({int limit = 20, int offset = 0}) async {
    var localResults = await _localRepository.getRecentMusic(page: offset ~/ limit, pageSize: limit);
    if (localResults.length < limit) {
      final remoteResults = await _remoteRepository.getRecentMusic(limit: limit, offset: offset);
      await _localRepository.saveMusics(remoteResults);
      localResults = await _localRepository.getRecentMusic(page: offset ~/ limit, pageSize: limit);
    }
    return localResults;
  }

  @override
  Future<List<Mp3Music>> getMusicByArtist(String artist, {int limit = 20, int offset = 0}) async {
    var localResults = await _localRepository.getMusicByArtist(artist, page: offset ~/ limit, pageSize: limit);
    if (localResults.length < limit) {
      final remoteResults = await _remoteRepository.getMusicByArtist(artist, limit: limit, offset: offset);
      await _localRepository.saveMusics(remoteResults);
      localResults = await _localRepository.getMusicByArtist(artist, page: offset ~/ limit, pageSize: limit);
    }
    return localResults;
  }

  @override
  Future<List<Mp3Music>> getMusicByAlbum(String album, {int limit = 20, int offset = 0}) async {
    var localResults = await _localRepository.getMusicByPage(page: offset ~/ limit, pageSize: limit);
    localResults = localResults.where((music) => music.album == album).toList();
    if (localResults.length < limit) {
      final remoteResults = await _remoteRepository.getMusicByAlbum(album, limit: limit, offset: offset);
      await _localRepository.saveMusics(remoteResults);
      localResults = await _localRepository.getMusicByPage(page: offset ~/ limit, pageSize: limit);
      localResults = localResults.where((music) => music.album == album).toList();
    }
    return localResults;
  }

  @override
  Future<List<Mp3Music>> getMusicByGenre(String genre, {int limit = 20, int offset = 0}) async {
    var localResults = await _localRepository.getMusicByGenre(genre, page: offset ~/ limit, pageSize: limit);
    if (localResults.length < limit) {
      final remoteResults = await _remoteRepository.getMusicByGenre(genre, limit: limit, offset: offset);
      await _localRepository.saveMusics(remoteResults);
      localResults = await _localRepository.getMusicByGenre(genre, page: offset ~/ limit, pageSize: limit);
    }
    return localResults;
  }

  @override
  Future<List<Mp3Music>> getSimilarMusic(String musicSlug, {int limit = 20}) async {
    final music = await getMusicBySlug(musicSlug);
    if (music != null) {
      return _localRepository.getSimilarMusic(music, page: 0, pageSize: limit);
    }
    return [];
  }

  @override
  Future<void> syncData() async {
    final remoteMusic = await _remoteRepository.fetchMusic(limit: _batchSize, offset: 0);
    await _localRepository.saveMusics(remoteMusic);
  }

  @override
  Future<void> clearCache() async {
    await _localRepository.deleteAllMusic();
    resetPagination();
    _hasMoreData = true;
  }

  @override
  Future<bool> needsUpdate() async {
    // This is a simplified check. You might want to implement a more sophisticated
    // method to determine if an update is needed, e.g., based on a timestamp.
    return await _localRepository.countMusic() == 0;
  }

  @override
  Future<void> preloadCache() async {
    await clearCache();
    await _fetchAndStoreMusic();
  }

  @override
  Future<Map<String, dynamic>> getMusicDetails(String slug) async {
    final music = await getMusicBySlug(slug);
    if (music != null) {
      // Here you might want to fetch additional details from the remote repository
      // and combine them with the local data
      final additionalDetails = await _remoteRepository.getMusicBySlug(slug);
      return {
        ...music.toJson(),
        ...additionalDetails.toJson(),
      };
    }
    return {};
  }

  Future<void> _fetchAndStoreMusic() async {
    final remoteMusic = await _remoteRepository.fetchMusic(limit: _batchSize, offset: _currentOffset);
    await _localRepository.saveMusics(remoteMusic);
    _currentOffset += remoteMusic.length;
    _hasMoreData = remoteMusic.length == _batchSize;
  }
}