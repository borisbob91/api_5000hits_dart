import 'mp3_video.dart';

abstract class Mp3VideoService {
  Future<void> initialize();
  Future<List<Mp3Video>> getNextPage();
  void resetPagination();
  Future<bool> hasMore();
  Future<List<Mp3Video>> searchVideos(String query, {int limit = 20, int offset = 0});
  Future<Mp3Video?> getVideoByYtId(String ytId);
  Future<List<Mp3Video>> getPopularVideos({int limit = 20, int offset = 0});
  Future<List<Mp3Video>> getRecentVideos({int limit = 20, int offset = 0});
  Future<void> syncData();
  Future<void> clearCache();
  Future<bool> needsUpdate();
  Future<void> preloadCache();
  Future<Mp3Video?> getVideoTrack(int videoId);
}