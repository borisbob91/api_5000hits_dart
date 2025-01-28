import 'package:api_5000hits/src/exceptions/album_exceptions.dart';
import 'package:api_5000hits/src/features/album/mp3_album_service_interface.dart';

import '../mp3_album.dart';
import '../mp3_album_local_repository_interface.dart';
import '../mp3_album_remote_repository_interface.dart';

class Mp3AlbumServiceImpl implements Mp3AlbumServiceInterface {
  final Mp3RemoteRepositoryInterface _remoteRepository;
  final Mp3AlbumLocalRepositoryInterface _localRepository;
  final Duration _cacheValidity = const Duration(hours: 24);

  Mp3AlbumServiceImpl(this._remoteRepository, this._localRepository);

  @override
  Future<List<Mp3Album>> getAlbums({int page = 0, int pageSize = 20}) async {
    try {
      final remoteAlbums = await _remoteRepository.fetchAlbums(
          offset: page * pageSize, limit: pageSize);
      // await _localRepository.saveAlbums(remoteAlbums);
      return remoteAlbums;
    } catch (e) {
      // return await _localRepository.getAllAlbums(
      //     page: page, pageSize: pageSize);
       throw AlbumFetchException(e.toString());
    }
  }

  @override
  Future<List<Mp3Album>> searchAlbums(String searchTerm,
      {int page = 0, int pageSize = 20}) async {
    try {
      final remoteResults = await _remoteRepository.fetchAlbums(
          search: searchTerm, offset: page * pageSize, limit: pageSize);
      // await _localRepository.saveAlbums(remoteResults);
      return remoteResults;
    } catch (e) {
      throw AlbumFetchException(e.toString());
      // return await _localRepository.searchAlbums(searchTerm,
      //     page: page, pageSize: pageSize);
    }
  }

  @override
  Future<List<Mp3Album>> getPopularAlbums(
      {int page = 0, int pageSize = 20}) async {
    try {
      List<Mp3Album> remoteAlbums = await _remoteRepository.fetchPopularsAlbums(page: page, pageSize: pageSize);
       return remoteAlbums;
    } catch (e, t) {
      throw AlbumFetchException(e.toString());
    }
  }

  @override
  Future<List<Mp3Album>> getAlbumsByGenre(String genre,
      {int page = 0, int pageSize = 20}) async {
    try {
      List<Mp3Album> remoteAlbums = await _remoteRepository.fetchAlbums(
          genre: genre, offset: page * pageSize, limit: pageSize);
      // await _localRepository.saveAlbums(remoteAlbums);
      print('genre result: $remoteAlbums');
      return remoteAlbums;
    } catch (e) {
      throw AlbumReadException(e.toString());
    }
  }

  @override
  Future<List<Mp3Album>> getAlbumsByArtist(String artist,
      {int country = 0, int page = 0, int pageSize = 20}) async {
    try {
      final remoteAlbums = await _remoteRepository.fetchAlbums(
          artist: artist,
          country: country,
          offset: page * pageSize,
          limit: pageSize);
      // await _localRepository.saveAlbums(remoteAlbums);
      print("-************artist albums $remoteAlbums");
      return remoteAlbums;
    } catch (e) {
      throw AlbumFetchException("fetch album By Artist failed: $e");
      // return await _localRepository.getAlbumsByArtist(artist, page: page, pageSize: pageSize);
    }
  }

  @override
  Future<List<Mp3Album>> getSimilarAlbums(Mp3Album album,
      {int page = 0, int pageSize = 20}) async {
    final simulars = await _remoteRepository.fetchSimularsAlbums(album.slug,
        page: page, pageSize: pageSize);
    return simulars;
  }


  @override
  Future<Mp3Album> getAlbumDetails(String slug) async {
    final album = await _remoteRepository.getAlbumBySlug(slug);
    return album;
  }

  @override
  Future<List<Mp3Album>> getTopDownloadAlbum(
      {int page = 1, int pageSize = 20}) async {
    final resultats = await _remoteRepository.fetchMostDownloadAlbums(
        page: page, pageSize: pageSize);
    return resultats;
  }

  @override
  Future<List<Mp3Album>> getArtistAlbumBySlug(
      {required String albumSlug}) async {
    final resultats =
        await _remoteRepository.fetchArtistAlbum(albumSlug: albumSlug);
    return resultats;
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
  Future<void> syncData() async {
    try {
      final remoteAlbums = await _remoteRepository.fetchAlbums(
          limit: 500); // Ajustez la limite selon vos besoins
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

}
