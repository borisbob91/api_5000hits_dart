import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:api_5000hits/src/features/album/mp3_cover.dart';
import 'package:isar/isar.dart';
import 'mp3_album_local_repository_interface.dart';
import 'mp3_album.dart';
import 'pagiination_results.dart';

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

  Future<PaginationResult<Mp3Album>> _paginateFilteredQuery(
    List<Mp3Album> query,
    int page,
    int pageSize,
  ) async {
    final allItems = await query;
    final totalCount = allItems.length;
    final startIndex = page * pageSize;
    final endIndex = (startIndex + pageSize).clamp(0, totalCount);
    
    final items = allItems.sublist(startIndex, endIndex);

    final result = PaginationResult(
      items: items,
      totalCount: totalCount,
      currentPage: page,
      pageSize: pageSize,
    );
    return result;
  }
  
Future<PaginationResult<Mp3Album>> _paginateQWhereQuery(
    QueryBuilder<Mp3Album, Mp3Album, QWhere> query,
    int page,
    int pageSize,
  ) async {
    final totalCount = await query.count();
    final items = await query.sortByUploadedDesc()
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();

    final result = PaginationResult(
      items: items,
      totalCount: totalCount,
      currentPage: page,
      pageSize: pageSize,
    );
    return result;
  }
  // @override
  // Future<List<Mp3Album>> getAllAlbums() async {
  //   return await isar.mp3Albums.where().findAll();
  // }
  
   @override
  Future<PaginationResult<Mp3Album>> getAllAlbums({int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
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
      });
    }
  }

  @override
  Future<void> saveAlbums(List<Mp3Album> albums) async {
    // verifie que l'album avec le slug  existe avant de le sauvegarder
    final existAlbums = await albums
       .map((album) => albumExists(album.slug))
       .toList();
    // extraire les albums non existe avant de les sauvegarder
    final albumsToSave = albums.where((item) => !existAlbums.contains(item)).toList();

    await isar.writeTxn(() async {
      // Sauvegarder d'abord toutes les couvertures
      final covers = albumsToSave
          .where((album) => album.cover.value != null)
          .map((album) => album.cover.value!)
          .toList();
      await isar.mp3Covers.putAll(covers);

      // Ensuite, sauvegarder tous les albums
      await isar.mp3Albums.putAll(albums);
    });

    albumsToSave.map((item){
      return updateAlbum(item);
    });
  }

 
   @override
  Future<void> updateAlbum(Mp3Album album) async {
    await isar.writeTxn(() async {
      // Rechercher l'album existant par slug
      final existingAlbum = await isar.mp3Albums.filter().slugEqualTo(album.slug).findFirst();

      if (existingAlbum != null) {
        // Mettre à jour l'ID de l'album à mettre à jour avec l'ID de l'album existant
        album.id = existingAlbum.id;

        // Mettre à jour la couverture si elle existe
        if (album.cover.value != null) {
          // Si la couverture existante a un ID, utilisez-le pour la mise à jour
          if (existingAlbum.cover.value?.id != null) {
            album.cover.value!.id = existingAlbum.cover.value!.id;
          }
          await isar.mp3Covers.put(album.cover.value!);
        }

        // Mettre à jour l'album
        await isar.mp3Albums.put(album);
      } else {
        // Si l'album n'existe pas, créez-le
        await isar.mp3Albums.put(album);
        if (album.cover.value != null) {
          await isar.mp3Covers.put(album.cover.value!);
        }
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
  Future<PaginationResult<Mp3Album>> searchAlbums(String searchTerm, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
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
      return _paginateFilteredQuery(query, page, pageSize);
  }

  @override
  Future<bool> albumExists(String slug) async {
    return await isar.mp3Albums.filter().slugEqualTo(slug).isNotEmpty();
  }

  @override
  Future<int> countAlbums() async {
    return await isar.mp3Albums.count();
  }

  @override
  Future<PaginationResult<Mp3Album>> getAlbumsByPage({int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return await _paginateQWhereQuery(isar.mp3Albums.where(), page, pageSize);
  }

  @override
  Future<PaginationResult<Mp3Album>> getAlbumsByGenre(String genre, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return await _paginateFilteredQuery(await isar.mp3Albums.filter().genreEqualTo(genre, caseSensitive: false).findAll(), page, pageSize);
  }

  @override
  Future<PaginationResult<Mp3Album>> getAlbumsByArtist(String artist, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return _paginateFilteredQuery(await isar.mp3Albums.filter().artistEqualTo(artist, caseSensitive: false).findAll(), page, pageSize);
  }

  @override
  Future<PaginationResult<Mp3Album>> getRecentAlbums( {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return _paginateQWhereQuery(isar.mp3Albums.where(), page, pageSize);
   
  }

  @override
  Future<PaginationResult<Mp3Album>> getPopularAlbums({int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return _paginateFilteredQuery(await isar.mp3Albums.where().sortByHitsDesc().findAll(), page, pageSize);
  }
  
  
@override
  Future<PaginationResult<Mp3Album>> getAlbumsByCountry(int countryCode, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return _paginateFilteredQuery(await isar.mp3Albums.filter().countryEqualTo(countryCode).findAll(), page, pageSize);
  }

  // Méthode optionnelle pour récupérer les albums par code pays avec pagination
  Future<List<Mp3Album>> getAlbumsByCountryCodePaginated(int countryCode, {int offset = 0, int limit = 20}) async {
    return await isar.mp3Albums
        .filter()
        .countryEqualTo(countryCode)
        .offset(offset)
        .limit(limit)
        .findAll();
  }
  

  @override
  Future<PaginationResult<Mp3Album>> getAlbumsByYearRange(String startYear, String endYear, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return _paginateFilteredQuery(await isar.mp3Albums.filter().yearBetween(startYear, endYear).findAll(), page, pageSize);
  }

   @override
  Future<PaginationResult<Mp3Album>> getSimilarAlbums(Mp3Album album,  {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}) async {
    return _paginateFilteredQuery(await isar.mp3Albums.filter().genreContains(album.genre!, caseSensitive: false).and().not().idEqualTo(album.id).sortByYear().findAll(), page, pageSize);
  }

  @override
  Future<PaginationResult<Mp3Album>> getAlbumsByDownloads({
    required int minDownloads,
     int maxDays= 60,
    int page = 0, int pageSize = DEFAULT_PAGE_SIZE
  }) async {
    final startDate = DateTime.now().subtract(Duration(days: maxDays));
    return _paginateFilteredQuery(await isar.mp3Albums.filter().hitsGreaterThan(minDownloads).and().uploadedGreaterThan(startDate).sortByHitsDesc().findAll(), page, pageSize);
  }
  
}