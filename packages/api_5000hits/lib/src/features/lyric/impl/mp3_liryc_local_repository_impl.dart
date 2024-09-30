import 'package:api_5000hits/src/features/lyric/mp3_lyric.dart';
import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:isar/isar.dart';

import '../mp3_lyric_local_repository.dart';

class Mp3LyricLocalRepositoryImpl implements Mp3LyricLocalRepository {
  final IsarManager isarManager;

  Mp3LyricLocalRepositoryImpl({required this.isarManager}) {
    isarManager.initialize();
  }

  Isar get isar => isarManager.isar;

  @override
  Future<List<Mp3Lyric>> getLyrics({
    String? search,
    int? country,
    String? title,
    String? artist,
    String? genre,
    int limit = 20,
    int page = 0
  }) async {
    final query = isar.mp3Lyrics.where();

    if (search != null) {
      query.filter()
          .titleContains(search, caseSensitive: false)
          .or()
          .artistContains(search, caseSensitive: false);
    }
    if (title != null) query.filter().titleContains(title, caseSensitive: false);
    if (artist != null) query.filter().artistContains(artist, caseSensitive: false);
    if (genre != null) query.filter().genreContains(genre, caseSensitive: false);

    return await query.offset(page * limit).limit(limit).findAll();
  }


  @override
  Future<void> saveOrUpdateLyric(Mp3Lyric lyric) async {
    await isar.writeTxn(() async {
      final existingLyric = await isar.mp3Lyrics.filter().idEqualTo(lyric.id).findFirst();
      if (existingLyric != null) {
        // Mise à jour de l'enregistrement existant
        lyric.id = existingLyric.id; // Assurez-vous de conserver l'ID Isar existant
        await isar.mp3Lyrics.put(lyric);
      } else {
        // Création d'un nouvel enregistrement
        await isar.mp3Lyrics.put(lyric);
      }
    });
  }

  Future<void> _saveOrUpdateAll(List<Mp3Lyric> lyrics) async {
    await isar.writeTxn(() async {
      for (var lyric in lyrics) {
        final existingLyric = await isar.mp3Lyrics.filter().idEqualTo(lyric.id).findFirst();
        if (existingLyric != null) {
          lyric.id = existingLyric.id;
        }
      }
      await isar.mp3Lyrics.putAll(lyrics);
    });
  }

  @override
  Future<void> saveLyrics(List<Mp3Lyric> lyrics) async {
   return await _saveOrUpdateAll(lyrics);
  }


  @override
  Future<void> deleteLyric({required String slug}) async {
    await isar.writeTxn(() async {
      await isar.mp3Lyrics.filter().songSlugEqualTo(slug).deleteAll();
    });
  }

  @override
  Future<void> deleteAllLyrics() async {
    await isar.writeTxn(() async {
      await isar.mp3Lyrics.clear();
    });
  }

  @override
  Future<bool> lyricExists({required String slug}) async {
    return await isar.mp3Lyrics.filter().songSlugEqualTo(slug).isNotEmpty();
  }

  @override
  Future<Mp3Lyric?> getLyricBySlug({required String slug}) async{
    return await isar.mp3Lyrics.filter().songSlugEqualTo(slug).findFirst();
  }

}