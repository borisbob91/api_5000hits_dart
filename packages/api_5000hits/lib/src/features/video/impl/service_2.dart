import 'dart:async';

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
    // Initialisation si nécessaire
  }

  @override
  Future<List<Mp3Video>> getNextPage() async {
    final localVideos = await _localRepository.getAllVideos(page: _currentOffset ~/ 20);
    
    // Lancer une requête en arrière-plan pour mettre à jour les données
    _updateVideosFromRemote();
    
    _currentOffset += localVideos.length;
    return localVideos;
  }

  Future<void> _updateVideosFromRemote() async {
    try {
      final remoteVideos = await _remoteRepository.fetchVideos(limit: _batchSize, offset: _currentOffset);
      await _localRepository.saveVideos(remoteVideos);
      _hasMoreData = remoteVideos.length == _batchSize;
    } catch (e) {
      print('Erreur lors de la mise à jour depuis le serveur: $e');
    }
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
    
    // Lancer une requête en arrière-plan pour mettre à jour les résultats de recherche
    _updateSearchResults(query, limit, offset);
    
    return localResults;
  }

  Future<void> _updateSearchResults(String query, int limit, int offset) async {
    try {
      final remoteResults = await _remoteRepository.searchVideos(query, limit: limit, offset: offset);
      await _localRepository.saveVideos(remoteResults);
    } catch (e) {
      print('Erreur lors de la mise à jour des résultats de recherche: $e');
    }
  }

  @override
  Future<Mp3Video?> getVideoByYtId(String ytId) async {
    var video = await _localRepository.getVideoByYtId(ytId);
    
    // Lancer une requête en arrière-plan pour mettre à jour la vidéo
    _updateVideoFromRemote(ytId);
    
    return video;
  }

  Future<void> _updateVideoFromRemote(String ytId) async {
    try {
      final remoteVideo = await _remoteRepository.getVideoByYtId(ytId);
      await _localRepository.saveOrUpdateVideo(remoteVideo);
    } catch (e) {
      print('Erreur lors de la mise à jour de la vidéo depuis le serveur: $e');
    }
  }

  @override
  Future<List<Mp3Video>> getPopularVideos({int limit = 20, int offset = 0}) async {
    var localResults = await _localRepository.getAllVideos(page: offset ~/ limit, pageSize: limit);
    localResults.sort((a, b) => b.views!.compareTo(a.views!));
    
    // Lancer une requête en arrière-plan pour mettre à jour les vidéos populaires
    _updatePopularVideos(limit, offset);
    
    return localResults.take(limit).toList();
  }

  Future<void> _updatePopularVideos(int limit, int offset) async {
    try {
      final remoteResults = await _remoteRepository.getPopularVideos(limit: limit, offset: offset);
      await _localRepository.saveVideos(remoteResults);
    } catch (e) {
      print('Erreur lors de la mise à jour des vidéos populaires: $e');
    }
  }

  @override
  Future<List<Mp3Video>> getRecentVideos({int limit = 20, int offset = 0}) async {
    var localResults = await _localRepository.getAllVideos(page: offset ~/ limit, pageSize: limit);
    localResults.sort((a, b) => b.added!.compareTo(a.added!));
    
    // Lancer une requête en arrière-plan pour mettre à jour les vidéos récentes
    _updateRecentVideos(limit, offset);
    
    return localResults.take(limit).toList();
  }

  Future<void> _updateRecentVideos(int limit, int offset) async {
    try {
      final remoteResults = await _remoteRepository.getRecentVideos(limit: limit, offset: offset);
      await _localRepository.saveVideos(remoteResults);
    } catch (e) {
      print('Erreur lors de la mise à jour des vidéos récentes: $e');
    }
  }



  @override
  Future<Mp3Video?> getVideoTrack(int videoId) async {
    final musicId = await _localRepository.getVideoMusic(videoId);
    var video = musicId != -1 ? await getVideoByYtId(musicId.toString()) : null;
    
    // Lancer une requête en arrière-plan pour mettre à jour la piste vidéo
    _updateVideoTrack(videoId);
    
    return video;
  }

  Future<void> _updateVideoTrack(int videoId) async {
    try {
      final remoteMusicId = await _remoteRepository.getVideoMusic(videoId);
      if (remoteMusicId != -1) {
        final remoteVideo = await _remoteRepository.getVideoByYtId(remoteMusicId.toString());
        await _localRepository.saveOrUpdateVideo(remoteVideo);
      }
    } catch (e) {
      print('Erreur lors de la mise à jour de la piste vidéo: $e');
    }
  }
  
  @override
  Future<void> clearCache() {
    // TODO: implement clearCache
    throw UnimplementedError();
  }
  
  @override
  Future<bool> needsUpdate() {
    // TODO: implement needsUpdate
    throw UnimplementedError();
  }
  
  @override
  Future<void> preloadCache() {
    // TODO: implement preloadCache
    throw UnimplementedError();
  }
  
  @override
  Future<void> syncData() {
    // TODO: implement syncData
    throw UnimplementedError();
  }
}