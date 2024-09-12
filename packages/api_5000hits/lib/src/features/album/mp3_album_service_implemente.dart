import 'package:api_5000hits/src/features/album/mp3_album_service_interface.dart';

import 'mp3_album.dart';
import 'mp3_album_local_repository_interface.dart';
import 'mp3_album_remote_repository_interface.dart';

class Mp3AlbumServiceImpl implements Mp3AlbumServiceInterface {
  final Mp3RemoteRepositoryInterface _remoteRepository;
  final Mp3AlbumLocalRepositoryInterface _localRepository;
  final Duration _cacheValidity = const Duration(hours: 24);

  Mp3AlbumServiceImpl(this._remoteRepository, this._localRepository);
  
  @override
  Future<List<Mp3Album>> getAlbums({int page = 0, int pageSize = 20}) async {
    try {
     final remoteAlbums = await _remoteRepository.fetchAlbums(offset: page * pageSize, limit: pageSize);
        _localRepository.saveAlbums(remoteAlbums);
        return remoteAlbums;
    } catch (e) {
      return await _localRepository.getAllAlbums(page: page, pageSize: pageSize);
    }
  }

  @override
  Future<List<Mp3Album>> searchAlbums(String searchTerm, {int page = 0, int pageSize = 20}) async {
    try {
      final remoteResults = await _remoteRepository.fetchAlbums(search: searchTerm, offset: page * pageSize, limit: pageSize);
      _localRepository.saveAlbums(remoteResults);
      return remoteResults;
    } catch (e) {
      return await _localRepository.searchAlbums(searchTerm, page: page, pageSize: pageSize);
    }
  }


  @override
  Future<List<Mp3Album>> getPopularAlbums({int page = 0, int pageSize = 20}) async {
    try {
        final remoteAlbums = await _remoteRepository.fetchAlbums(offset: page * pageSize, limit: pageSize*5);
         await _localRepository.saveAlbums(remoteAlbums);
        return await _localRepository.getPopularAlbums(page: page, pageSize: pageSize);
        // return remoteAlbums;
    } catch (e) {
      return await _localRepository.getPopularAlbums(page: page, pageSize: pageSize);
    }
  }

  @override
  Future<List<Mp3Album>> getRecentAlbums({int page = 0, int pageSize = 20}) async {
    try {
      final remoteAlbums = await _remoteRepository.fetchAlbums(offset: page * pageSize, limit: pageSize);
      _localRepository.saveAlbums(remoteAlbums);
      return remoteAlbums;
    } catch (e) {
      return await _localRepository.getRecentAlbums(page: page, pageSize: pageSize);
    }
  }

  @override
  Future<List<Mp3Album>> getAlbumsByGenre(String genre, {int page = 0, int pageSize = 20}) async {
    try {
      if (await needsUpdate()) {
        final remoteAlbums = await _remoteRepository.fetchAlbums(genre: genre, offset: page * pageSize, limit: pageSize);
         _localRepository.saveAlbums(remoteAlbums);
        return remoteAlbums;
      } else {
        return await _localRepository.getAlbumsByGenre(genre, page: page, pageSize: pageSize);
      }
    } catch (e) {
      return await _localRepository.getAlbumsByGenre(genre, page: page, pageSize: pageSize);
    }
  }

  @override
  Future<List<Mp3Album>> getAlbumsByArtist(String artist, {int page = 0, int pageSize = 20}) async {
    try {
        final remoteAlbums = await _remoteRepository.fetchAlbums(artist: artist, offset: page * pageSize, limit: pageSize);
         _localRepository.saveAlbums(remoteAlbums);
        return remoteAlbums;
    } catch (e) {
      return await _localRepository.getAlbumsByArtist(artist, page: page, pageSize: pageSize);
    }
  }

  @override
  Future<List<Mp3Album>> getSimilarAlbums(Mp3Album album, {int page = 0, int pageSize = 20}) async {
    final sameGender = await  _remoteRepository.fetchAlbums(genre: album.genre, offset: page * pageSize, limit: pageSize*10);
    final samecountry= await  _remoteRepository.fetchAlbums(country: album.country, offset: page * pageSize, limit: pageSize*10);
    // await _localRepository.saveAlbums(sameGender);
    // await _localRepository.saveAlbums(samecountry);
    sameGender.addAll(samecountry.where((toElement) => !sameGender.contains(toElement)).toList());
    await _localRepository.saveAlbums(sameGender);

    return await _localRepository.getSimilarAlbums(album, page: page, pageSize: pageSize);
  }

  @override
  Future<void> syncData() async {
    try {
      final remoteAlbums = await _remoteRepository.fetchAlbums(limit: 500); // Ajustez la limite selon vos besoins
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
    return DateTime.now().subtract(const Duration(hours: 6));
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
    final album = await _remoteRepository.getAlbumBySlug(slug);
    print("album detail fetch! ${album.tracks}");
    //final tracks = await _remoteRepository.getAlbumTracks(slug);
    // final result = await Future.wait([_remoteRepository.getAlbumBySlug(slug), _remoteRepository.getAlbumTracks(slug)]);
    return album;
    //return album.copyWith(tracks: tracks);  // Assuming Mp3Album has a tracks field
  }
  

}


// final localDb = Mp3AlbumLocalRepositoryImplemente(isarManager: IsarManager());
// final remoteDb = Mp3AlbumRemoteRepositoryImplemente(apiClient: ApiClient());

// final albumService = Mp3AlbumServiceImpl(remoteDb, localDb);