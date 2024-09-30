import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:api_5000hits/src/features/album/mp3_cover.dart';
import 'package:isar/isar.dart';
import '../mp3_music.dart';
import '../mp3_music_local_repository.dart';

class Mp3MusicLocalRepositoryImplemente implements Mp3MusicLocalRepository {

  final IsarManager isarManager;
  Mp3MusicLocalRepositoryImplemente({required this.isarManager}){
    // Initialize IsarManager
    //isarManager.initialize();
    isarManager.addSchema(Mp3MusicSchema);
  }

  // get isar
  Isar get isar => isarManager.isar;

  @override
  Future<List<Mp3Music>> getAllMusic({int page = 0, int pageSize = Mp3MusicLocalRepository.DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Musics
        .where()
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<Mp3Music?> getMusicBySlug(String slug) async {
    return await isar.mp3Musics.filter().slugEqualTo(slug).findFirst();
  }

  @override
  Future<void> saveOrUpdateMusic(Mp3Music music) async {

    await isar.writeTxn(() async {
      await isar.mp3Covers.put(music.cover.value!);
      await isar.mp3Musics.put(music);
      music.cover.save();

    });
  }

  @override
  Future<void> saveMusics(List<Mp3Music> musics) async {
    musics.map((toElement)async{
      await saveOrUpdateMusic(toElement);
    });
  }

  @override
  Future<void> deleteMusic({required String slug}) async {
   final found = await this.getMusicBySlug(slug);
    await isar.writeTxn(() async {
      await isar.mp3Musics.delete(found!.id);
    });
  }

  @override
  Future<void> deleteAllMusic() async {
    await isar.writeTxn(() async {
      await isar.mp3Musics.clear();
    });
  }

  @override
  Future<List<Mp3Music>> searchMusic(String searchTerm, {int page = 0, int pageSize = Mp3MusicLocalRepository.DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Musics
        .filter()
        .titleContains(searchTerm, caseSensitive: false)
        .or()
        .artistContains(searchTerm, caseSensitive: false)
        .or()
        .albumContains(searchTerm, caseSensitive: false)
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<bool> musicExists(String slug) async {
    return await isar.mp3Musics.filter().slugEqualTo(slug).isNotEmpty();
  }

  @override
  Future<int> countMusic() async {
    return await isar.mp3Musics.count();
  }

  @override
  Future<List<Mp3Music>> getMusicByPage({int page = 0, int pageSize = Mp3MusicLocalRepository.DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Musics
        .where()
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<List<Mp3Music>> getMusicByGenre(String genre, {int page = 0, int pageSize = Mp3MusicLocalRepository.DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Musics
        .filter()
        .genreEqualTo(genre)
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<List<Mp3Music>> getMusicByArtist(String artist, {int page = 0, int pageSize = Mp3MusicLocalRepository.DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Musics
        .filter()
        .artistEqualTo(artist)
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<List<Mp3Music>> getRecentMusic({int page = 0, int pageSize = Mp3MusicLocalRepository.DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Musics
        .where()
        .sortByUploadedDesc()
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<List<Mp3Music>> getPopularMusic({int page = 0, int pageSize = Mp3MusicLocalRepository.DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Musics
        .where()
        .sortByHitsDesc()
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<List<Mp3Music>> getMusicByCountry(int countryCode, {int page = 0, int pageSize = Mp3MusicLocalRepository.DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Musics
        .filter()
        .countryEqualTo(countryCode)
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<List<Mp3Music>> getMusicByYearRange(String startYear, String endYear, {int page = 0, int pageSize = Mp3MusicLocalRepository.DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Musics
        .filter()
        .yearBetween(startYear, endYear)
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<List<Mp3Music>> getSimilarMusic(Mp3Music music, {int page = 0, int pageSize = Mp3MusicLocalRepository.DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Musics
        .filter()
        .genreEqualTo(music.genre ?? '')
        .and()
        .not()
        .idEqualTo(music.id)
        .or()
        .countryEqualTo(music.country)
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<List<Mp3Music>> getMusicByDownloads({
    required int minDownloads,
    int maxDays = 60,
    int page = 0,
    int pageSize = Mp3MusicLocalRepository.DEFAULT_PAGE_SIZE,
  }) async {
    final startDate = DateTime.now().subtract(Duration(days: maxDays));
    return await isar.mp3Musics
        .filter()
        .hitsGreaterThan(minDownloads)
        .and()
        .uploadedGreaterThan(startDate)
        .sortByHitsDesc()
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }
}