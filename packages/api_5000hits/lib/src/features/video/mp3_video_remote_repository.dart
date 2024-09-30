import 'mp3_video.dart';

abstract interface class Mp3VideoRemoteRepository {
  Future<List<Mp3Video>> fetchVideos({String? search,  int? country,String? title, String? artist, String? genre,  int limit = 20, int page = 0});
  Future<Mp3Video> getVideoBySlug({required String slug});
}