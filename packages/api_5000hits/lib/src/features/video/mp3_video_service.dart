import 'mp3_video.dart';

abstract interface class Mp3VideoService {
  // Future<List<Mp3Video>> getNextPage();
  void resetPagination();
  Future<List<Mp3Video>> fetchVideos( {String? searchQuery, String? title, String? artist,  String? genre, int? country, int limit = 20, int page = 1});
  Future<List<Mp3Video>> searchVideos(String query, {int limit = 20, int page = 1});
  Future<List<Mp3Video>> getVideosByArtist(String artist, {int limit = 20, int page = 1});
  Future<Mp3Video?> getVideoBySlug({required String slug});
  Future<void> syncData();
  Future<void> clearCache();
  Future<void> saveVideo({required Mp3Video video});
  Future<void> preloadCache();
}