import 'mp3_video.dart';

abstract class Mp3VideoRemoteRepository {
  Future<List<Mp3Video>> fetchVideos({int limit = 20, int offset = 0});
  Future<Mp3Video> getVideoByYtId(String ytId);
  Future<List<Mp3Video>> searchVideos(String query, {int limit = 20, int offset = 0});
  Future<List<Mp3Video>> getPopularVideos({int limit = 20, int offset = 0});
  Future<List<Mp3Video>> getRecentVideos({int limit = 20, int offset = 0});
  bool canFetchNext();
  Future<List<Mp3Video>> fetchNextVideos();
  Future<int> getVideoMusic(int videoId);
}