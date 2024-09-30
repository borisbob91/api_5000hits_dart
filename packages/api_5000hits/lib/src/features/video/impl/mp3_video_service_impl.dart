import 'dart:async';

import '../mp3_video.dart';
import '../mp3_video_local_repository.dart';
import '../mp3_video_remote_repository.dart';
import '../mp3_video_service.dart';

class Mp3VideoServiceImpl implements Mp3VideoService {
  final Mp3VideoLocalRepository _localRepository;
  final Mp3VideoRemoteRepository _remoteRepository;
  bool _hasMoreData = true;
  static const int _batchSize = 100;
  static List<Mp3Video> _currentData = [];
  static  int _currentPage=1;

  Mp3VideoServiceImpl(this._localRepository, this._remoteRepository);

  @override
  Future<List<Mp3Video>> fetchVideos({String? searchQuery, String? title, String? artist, String? genre, int? country, int limit = _batchSize, int page = 1}) async{
    final remoteVideos = await _remoteRepository.fetchVideos(limit: limit, page: page, title: title, artist: artist, genre: genre);
    _currentPage += 1;
    _hasMoreData = remoteVideos.length == _batchSize;
    _currentData = remoteVideos;
    return remoteVideos;
  }
  
  @override
  void resetPagination() {
    _currentPage = 0;
  }

  @override
  Future<List<Mp3Video>> searchVideos(String query, {int limit = _batchSize, int page = 1}) async {
    var localResults = await fetchVideos(searchQuery: query, page: page, limit: limit);
    return localResults;
  }

  @override
  Future<Mp3Video?> getVideoBySlug({required String slug}) async {
    var video = await _remoteRepository.getVideoBySlug(slug: slug);
    return video;
  }

  @override
  Future<List<Mp3Video>> getVideosByArtist(String artist, {int limit = 20, int page = 1}) async{
    return await fetchVideos(artist: artist, page: page, limit: limit);
  }

  @override
  Future<void> saveVideo({required Mp3Video video}) async{
     await _localRepository.saveOrUpdateVideo(video);
  }

  @override
  Future<void> clearCache() async{
    await _localRepository.deleteAllVideos();
  }

  @override
  Future<void> preloadCache() async {
    await clearCache();
    _currentData = await _remoteRepository.fetchVideos(limit: 100);
    await _localRepository.saveOrUpdateVideos(_currentData);
  }
  
  @override
  Future<void> syncData() {
    // TODO: implement syncData
    throw UnimplementedError();
  }




}