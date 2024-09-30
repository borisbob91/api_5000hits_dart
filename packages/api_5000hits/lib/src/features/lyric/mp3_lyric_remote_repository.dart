import 'mp3_lyric.dart';

abstract interface class Mp3LyricRemoteRepository {
  Future<List<Mp3Lyric>> fetchLyrics({String? search,  int? country,String? title, String? artist, String? genre,  int limit = 20, int page = 0});
  Future<Mp3Lyric> getLyricBySlug(String slug);
}