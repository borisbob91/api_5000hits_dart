import 'package:api_5000hits/src/features/lyric/mp3_lyric.dart';

abstract interface class Mp3LyricLocalRepository {
  Future<List<Mp3Lyric>> getLyrics(
      {String? search,
      int? country,
      String? title,
      String? artist,
      String? genre,
      int limit = 20,
      int page = 0
      });

  Future<Mp3Lyric?> getLyricBySlug({required String slug});

  Future<void> saveOrUpdateLyric(Mp3Lyric lyric);

  Future<void> saveLyrics(List<Mp3Lyric> lyrics);

  Future<void> deleteLyric({required String slug});

  Future<void> deleteAllLyrics();

  Future<bool> lyricExists({required String slug});
}
