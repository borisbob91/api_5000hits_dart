import 'mp3_video.dart';

abstract class Mp3VideoLocalRepository {
  Future<List<Mp3Video>> getAllVideos({int page = 0, int pageSize = 20});
  Future<Mp3Video?> getVideoByYtId(String ytId);
  Future<void> saveOrUpdateVideo(Mp3Video video);
  Future<void> saveVideos(List<Mp3Video> videos);
  Future<void> deleteVideo(String ytId);
  Future<void> deleteAllVideos();
  Future<List<Mp3Video>> searchVideos(String searchTerm, {int page = 0, int pageSize = 20});
  Future<bool> videoExists(String ytId);
  Future<int> getVideoMusic(int videoId);

}