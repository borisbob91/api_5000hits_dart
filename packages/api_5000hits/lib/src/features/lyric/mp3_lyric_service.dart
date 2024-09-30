import 'package:api_5000hits/src/features/lyric/mp3_lyric.dart';

abstract interface class Mp3LyricService {
  /// Récupère une liste de paroles en fonction des critères de recherche fournis.
  Future<List<Mp3Lyric>> getLyrics({
    String? search,
    int? country,
    String? title,
    String? artist,
    String? genre,
    int limit = 20,
    int page = 0
  });

  /// Récupère les paroles spécifiques à partir de l'ID de la music.
  Future<Mp3Lyric> getLyricBySlug(String slug);
  Future<void> saveOrUpdateLyric(Mp3Lyric lyric);
  Future<void> clearCache();
  Future<void> deleteLyric({required String slug});

}