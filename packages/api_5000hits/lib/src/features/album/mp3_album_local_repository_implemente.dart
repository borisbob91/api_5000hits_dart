import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:api_5000hits/src/features/album/mp3_cover.dart';
import 'package:isar/isar.dart';
import 'mp3_album.dart';
import 'mp3_album_local_repository_interface.dart';

class Mp3AlbumLocalRepositoryImplemente implements Mp3AlbumLocalRepositoryInterface {

  final IsarManager isarManager;
 // ignore: constant_identifier_names
 static const int DEFAULT_PAGE_SIZE = 20;

  Mp3AlbumLocalRepositoryImplemente({required this.isarManager}){
    print("initializing Mp3AlbumLocalRepositoryImplemente and isar instance");
    isarManager.initialize();
  }

  // get isar
  Isar get isar => isarManager.isar;

  
Future<List<Mp3Album>> _paginateQWhereQuery(
    QueryBuilder<Mp3Album, Mp3Album, QWhere> query,
    int page,
    int pageSize,
  ) async {
    final items = await query.sortByUploadedDesc()
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
    return items;
  }
  // @override
  // Future<List<Mp3Album>> getAllAlbums() async {
  //   return await isar.mp3Albums.where().findAll();
  // }
  
   @override
  Future<List<Mp3Album>> getAllAlbums({int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    final query =  isar.mp3Albums.where();
    return await _paginateQWhereQuery(query, page, pageSize);
  }

  @override
  Future<Mp3Album?> getAlbumBySlug(String slug) async {
    return await isar.mp3Albums.filter().slugEqualTo(slug).findFirst();
  }

 
 @override
  Future<void> saveAlbum(Mp3Album album) async {
    bool exist = await albumExists(album.slug);
    print("album with slug ${album.slug} exist : $exist");
    if (exist) {
      await updateAlbum(album);
    } else {
      await isar.writeTxn(() async {
        // Sauvegarder d'abord la couverture si elle existe
        if (album.cover.value != null) {
          await isar.mp3Covers.put(album.cover.value!);
        }
        // Ensuite, sauvegarder l'album
        await isar.mp3Albums.put(album);
        await album.cover.save();
      });
    }
  }

  @override
  Future<void> saveAlbums(List<Mp3Album> albums) async {
    for (var album in albums) {
       saveAlbum(album);
    }
  }

 
   @override
  Future<void> updateAlbum(Mp3Album album) async {
    await isar.writeTxn(() async {
      // Rechercher l'album existant par slug
      final existingAlbum = await getAlbumBySlug(album.slug);

      if (existingAlbum != null) {
        // Mettre à jour l'ID de l'album à mettre à jour avec l'ID de l'album existant
        album.id = existingAlbum.id;

        // Mettre à jour la couverture si elle existe
        if (album.cover.value != null) {
          // Si la couverture existante a un ID, utilisez-le pour la mise à jour
          if (existingAlbum.cover.value?.id != null) {
            album.cover.value!.id = existingAlbum.cover.value!.id;
            album.cover.save();
          }
          await isar.mp3Covers.put(album.cover.value!);
        
        }

        // Mettre à jour l'album
        await isar.mp3Albums.put(album);
      } else {
        // Si l'album n'existe pas, créez-le
       
        if (album.cover.value != null) {
          await isar.mp3Covers.put(album.cover.value!);
        }
         await isar.mp3Albums.put(album);
         album.cover.saveSync();
      }
    });
  }
  // Nouvelle méthode pour supprimer un album et sa couverture
  @override
  Future<void> deleteAlbum(Id id) async {
    await isar.writeTxn(() async {
      final album = await isar.mp3Albums.get(id);
      if (album != null && album.cover.value != null) {
        await isar.mp3Covers.delete(album.cover.value!.id!);
      }
      await isar.mp3Albums.delete(id);
    });
  }

  // Méthode modifiée pour supprimer tous les albums et leurs couvertures
  @override
  Future<void> deleteAllAlbums() async {
    await isar.writeTxn(() async {
      await isar.mp3Covers.clear();
      await isar.mp3Albums.clear();
    });
  }
 

  @override
  Future<List<Mp3Album>> searchAlbums(String searchTerm, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    if (searchTerm.isEmpty) {
      return getAllAlbums(page: page, pageSize: pageSize);
    }
    final query =  await isar.mp3Albums
        .filter()
        .nameContains(searchTerm, caseSensitive: false)
        .or()
        .artistContains(searchTerm, caseSensitive: false)
        .or()
        .genreContains(searchTerm, caseSensitive: false)
        .findAll();
      return query;
  }

  @override
  Future<bool> albumExists(String slug) async {
    return await isar.mp3Albums.filter().slugEqualTo(slug).isNotEmpty();
  }


  @override
  Future<List<Mp3Album>> getAlbumsByGenre(String genre, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Albums
    .filter()
    .genreContains(genre, caseSensitive: false)
    .offset(page * pageSize)
    .limit(pageSize)
    .findAll();
  }

  @override
  Future<List<Mp3Album>> getAlbumsByArtist(String artist, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Albums.filter().artistEqualTo(artist, caseSensitive: false).findAll(); 
    }

  @override
  Future<List<Mp3Album>> getRecentAlbums( {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return _paginateQWhereQuery(isar.mp3Albums.where(), page, pageSize);
  }

  @override
  Future<List<Mp3Album>> getPopularAlbums({int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Albums
    .where()
    .sortByHitsDesc()
    .offset(page * pageSize)
    .limit(pageSize)
    .findAll();
  }
  
  
@override
  Future<List<Mp3Album>> getAlbumsByCountry(int countryCode, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Albums.filter().countryEqualTo(countryCode).findAll();
  }

   @override
  Future<List<Mp3Album>> getSimilarAlbums(Mp3Album album,  {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return await isar.mp3Albums
    .filter()
    .genreContains(album.genre!, caseSensitive: false)
    .or()
    .countryEqualTo(album.country!)
    .and()
    .not()
    .slugEqualTo(album.slug)
    .sortByYear()
    .findAll();
  }

  @override
  Future<List<Mp3Album>> getAlbumsByDownloads({
    required int minDownloads,
     int maxDays= 60,
    int page = 0, int pageSize = DEFAULT_PAGE_SIZE
  }) async {
    final startDate = DateTime.now().subtract(Duration(days: maxDays));
    return await isar.mp3Albums.filter().hitsGreaterThan(minDownloads).and().uploadedGreaterThan(startDate).sortByHitsDesc().findAll();
  }
  
}