import 'package:api_5000hits/src/features/video/mp3_video.dart';
import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:api_5000hits/src/features/video/mp3_video_service.dart';

import 'src/features/video/impl/mp3_video_local_repository_impl.dart';
import 'src/features/video/impl/mp3_video_remote_repository_impl.dart';
import 'src/features/video/impl/mp3_video_service_impl.dart';
import 'src/features/video/mp3_video_local_repository.dart';
import 'src/features/video/mp3_video_remote_repository.dart';
import 'src/utils/api_client.dart';


class VideoContrat implements Mp3VideoService {
  static VideoContrat? _instance;
   static Mp3VideoService? _service;

  factory VideoContrat() {
    if (_instance == null) {
      final localDb = Mp3VideoLocalRepositoryImpl(isarManager: IsarManager());
      final remoteDb = Mp3VideoRemoteRepositoryImpl(apiClient: ApiClient());
      _instance = VideoContrat._internal(remoteRepository: remoteDb, localRepository: localDb);
    }
    return _instance!;
  }

  VideoContrat._internal({
    required Mp3VideoRemoteRepository remoteRepository,
    required Mp3VideoLocalRepository localRepository
  })  {
    _service = Mp3VideoServiceImpl(localRepository, remoteRepository);
  }

  Future<void> downloadVideo(String slug) async {
    final video = await getVideoBySlug(slug: slug);
  }

  @override
  Future<void> clearCache() {
   return _service!.clearCache();
  }

  @override
  Future<List<Mp3Video>> fetchVideos({String? searchQuery, String? title, String? artist, String? genre, int? country, int limit = 20, int page = 1}) async {
    return await _service!.fetchVideos(searchQuery: searchQuery, artist: artist, genre: genre, title: title, limit: limit, page: page);
  }

  @override
  Future<Mp3Video?> getVideoBySlug({required String slug})async {
   return await _service!.getVideoBySlug(slug: slug);
  }

  @override
  Future<List<Mp3Video>> getVideosByArtist(String artist, {int limit = 20, int page = 1}) {
   return _service!.getVideosByArtist(artist, limit: limit, page: page);
  }

  @override
  Future<void> preloadCache() async{
    return await _service!.preloadCache();
  }

  @override
  void resetPagination() {
   return _service!.resetPagination();
  }

  @override
  Future<void> saveVideo({required Mp3Video video}) async {
   return await _service!.saveVideo(video: video);
  }

  @override
  Future<List<Mp3Video>> searchVideos(String query, {int limit = 20, int page = 1}) async{
    return await _service!.searchVideos(query, limit: limit, page: page);
  }

  @override
  Future<void> syncData() async{
   return await _service!.syncData();
  }

}
