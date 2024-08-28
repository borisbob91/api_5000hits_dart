import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:api_5000hits/src/features/album/mp3_service_interface.dart';
import 'package:api_5000hits/src/utils/api_client.dart';

import 'mp3_album.dart';
import 'mp3_album_local_repository_implemente.dart';
import 'mp3_album_local_repository_interface.dart';
import 'mp3_album_remote_repository_implemente.dart';
import 'pagiination_results.dart';


class Mp3AlbumServiceImplemente {
  // static Mp3AlbumServiceImplemente? _instance;
  static Mp3AlbumServiceImplemente _instance = Mp3AlbumServiceImplemente._internal();
  late final Mp3AlbumLocalRepositoryImplemente _localRepository;

  factory Mp3AlbumServiceImplemente() => _instance;

  Mp3AlbumServiceImplemente._internal() {
    print("Mp3AlbumServiceImplemente._internal() execution");
    _localRepository = Mp3AlbumLocalRepositoryImplemente(isarManager: IsarManager());
  }

  }

class Mp3AlbumServiceImpl implements Mp3AlbumServiceInterface {
  final Mp3RemoteRepositoryInterface _remoteRepository;
  final Mp3AlbumLocalRepositoryInterface _localRepository;
  final Duration _cacheValidity = const Duration(hours: 24);

  Mp3AlbumServiceImpl(this._remoteRepository, this._localRepository);
  
  @override
  Future<List<Mp3Album>> getAlbums({int page = 0, int pageSize = 20}) async {
    print('try fetching**************************');
    final remoteAlbums = await _remoteRepository.fetchAlbums();
    try {
      if (await needsUpdate()) {
        print("need to update");
        final remoteAlbums = await _remoteRepository.fetchAlbums(offset: page * pageSize, limit: pageSize);
        print('result: $remoteAlbums');
         _localRepository.saveAlbums(remoteAlbums);
        final i = PaginationResult(
          items: remoteAlbums,
          totalCount: remoteAlbums.length,
          currentPage: page,
          pageSize: pageSize,
        );
        return remoteAlbums;
      } else {
        final d = await _localRepository.getAllAlbums(page: page, pageSize: pageSize);
        return  d.items;
      }
    } catch (e) {
      final d = await _localRepository.getAllAlbums(page: page, pageSize: pageSize);
       return d.items;
    }
  }

  @override
  Future<PaginationResult<Mp3Album>> searchAlbums(String searchTerm, {int page = 0, int pageSize = 20}) async {
    try {
      final localResults = await _localRepository.searchAlbums(searchTerm, page: page, pageSize: pageSize);
      if (localResults.items.isEmpty || await needsUpdate()) {
        final remoteResults = await _remoteRepository.fetchAlbums(search: searchTerm, offset: page * pageSize, limit: pageSize);
        _localRepository.saveAlbums(remoteResults);
        return PaginationResult(
          items: remoteResults,
          totalCount: remoteResults.length,
          currentPage: page,
          pageSize: pageSize,
        );
      }
      return localResults;
    } catch (e) {
      return await _localRepository.searchAlbums(searchTerm, page: page, pageSize: pageSize);
    }
  }

  @override
  Future<Mp3Album?> getAlbumBySlug(String slug) async {
    try {
      final localAlbum = await _localRepository.getAlbumBySlug(slug);
      if (localAlbum == null || await needsUpdate()) {
        final remoteAlbum = await _remoteRepository.getAlbumBySlug(slug);
         _localRepository.saveAlbum(remoteAlbum);
        return remoteAlbum;
      }
      return localAlbum;
    } catch (e) {
      return await _localRepository.getAlbumBySlug(slug);
    }
  }

  @override
  Future<PaginationResult<Mp3Album>> getPopularAlbums({int page = 0, int pageSize = 20}) async {
    try {
      if (await needsUpdate()) {
        final remoteAlbums = await _remoteRepository.fetchAlbums(offset: page * pageSize, limit: pageSize);
         _localRepository.saveAlbums(remoteAlbums);
        return PaginationResult(
          items: remoteAlbums,
          totalCount: remoteAlbums.length,
          currentPage: page,
          pageSize: pageSize,
        );
      } else {
        return await _localRepository.getPopularAlbums(page: page, pageSize: pageSize);
      }
    } catch (e) {
      return await _localRepository.getPopularAlbums(page: page, pageSize: pageSize);
    }
  }

  @override
  Future<PaginationResult<Mp3Album>> getRecentAlbums({int page = 0, int pageSize = 20}) async {
    try {
      final remoteAlbums = await _remoteRepository.fetchAlbums(offset: page * pageSize, limit: pageSize);
      _localRepository.saveAlbums(remoteAlbums);
      return PaginationResult(
        items: remoteAlbums,
        totalCount: remoteAlbums.length,
        currentPage: page,
        pageSize: pageSize,
      );
    } catch (e) {
      return await _localRepository.getRecentAlbums(page: page, pageSize: pageSize);
    }
  }

  @override
  Future<PaginationResult<Mp3Album>> getAlbumsByGenre(String genre, {int page = 0, int pageSize = 20}) async {
    try {
      if (await needsUpdate()) {
        final remoteAlbums = await _remoteRepository.fetchAlbums(genre: genre, offset: page * pageSize, limit: pageSize);
         _localRepository.saveAlbums(remoteAlbums);
        return PaginationResult(
          items: remoteAlbums,
          totalCount: remoteAlbums.length,
          currentPage: page,
          pageSize: pageSize,
        );
      } else {
        return await _localRepository.getAlbumsByGenre(genre, page: page, pageSize: pageSize);
      }
    } catch (e) {
      return await _localRepository.getAlbumsByGenre(genre, page: page, pageSize: pageSize);
    }
  }

  @override
  Future<PaginationResult<Mp3Album>> getAlbumsByArtist(String artist, {int page = 0, int pageSize = 20}) async {
    try {
      final local = await _localRepository.getAlbumsByArtist(artist, page: page, pageSize: pageSize);
      if (await needsUpdate() || local.items.isEmpty) {
        final remoteAlbums = await _remoteRepository.fetchAlbums(artist: artist, offset: page * pageSize, limit: pageSize);
         _localRepository.saveAlbums(remoteAlbums);
        return PaginationResult(
          items: remoteAlbums,
          totalCount: remoteAlbums.length,
          currentPage: page,
          pageSize: pageSize,
        );
      } else {
        return await _localRepository.getAlbumsByArtist(artist, page: page, pageSize: pageSize);
      }
    } catch (e) {
      return await _localRepository.getAlbumsByArtist(artist, page: page, pageSize: pageSize);
    }
  }

  @override
  Future<PaginationResult<Mp3Album>> getSimilarAlbums(Mp3Album album, {int page = 0, int pageSize = 20}) async {
    // Cette méthode utilise uniquement le dépôt local
     _remoteRepository.fetchAlbums(genre: album.genre, offset: page * pageSize, limit: pageSize);
     _remoteRepository.fetchAlbums(country: album.country, offset: page * pageSize, limit: pageSize);
    
    return await _localRepository.getSimilarAlbums(album, page: page, pageSize: pageSize);
  }

  @override
  Future<void> syncData() async {
    try {
      final remoteAlbums = await _remoteRepository.fetchAlbums(limit: 1000); // Ajustez la limite selon vos besoins
      await _localRepository.saveAlbums(remoteAlbums);
    } catch (e) {
      print('Erreur lors de la synchronisation: $e');
    }
  }

  @override
  Future<bool> needsUpdate() async {
    final lastUpdateTime = await _getLastUpdateTime();
    return DateTime.now().difference(lastUpdateTime) > _cacheValidity;
  }

  Future<DateTime> _getLastUpdateTime() async {
    // Implémentez cette méthode pour récupérer le timestamp de la dernière mise à jour
    return DateTime.now().subtract(const Duration(hours: 25)); // Pour les tests
  }

  @override
  Future<void> clearCache() async {
    await _localRepository.deleteAllAlbums();
  }

  @override
  Future<void> preloadCache() async {
    final popularAlbums = await _remoteRepository.fetchAlbums(limit: 100);
    await _localRepository.saveAlbums(popularAlbums);
  }
  
  
   @override
  Future<Mp3Album> getAlbumDetails(String slug) async {
    //final album = await _remoteRepository.getAlbumBySlug(slug);
    //final tracks = await _remoteRepository.getAlbumTracks(slug);
    final result = await Future.wait([_remoteRepository.getAlbumBySlug(slug), _remoteRepository.getAlbumTracks(slug)]);
    return result.first as Mp3Album;
    //return album.copyWith(tracks: tracks);  // Assuming Mp3Album has a tracks field
  }
  

}


final localDb = Mp3AlbumLocalRepositoryImplemente(isarManager: IsarManager());
final remoteDb = Mp3AlbumRemoteRepositoryImplemente(apiClient: ApiClient());

final albumService = Mp3AlbumServiceImpl(remoteDb, localDb);