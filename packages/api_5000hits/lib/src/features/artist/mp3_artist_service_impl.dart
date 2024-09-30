import 'package:api_5000hits/src/features/album/mp3_album.dart';
import 'package:api_5000hits/src/features/music/mp3_music.dart';
import 'package:api_5000hits/src/features/artist/mp3_artist.dart';

import 'mp3_Artist_remote_repository_interface.dart';
import 'artist_service_interface.dart';

class Mp3ArtistServiceImpl implements Mp3ArtistService {
  final Mp3ArtistRemoteRepositoryInterface _remoteRepository;

  Mp3ArtistServiceImpl(this._remoteRepository);

  @override
  Future<List<Mp3Artist>> getArtists({int page = 1, int pageSize = 20, String? search, String? country, String? name }) async {
    return await _remoteRepository.fetchArtists(
      search: search,
      country: country,
      name: name,
      page: page,
      limit: pageSize,
    );
  }

  @override
  Future<Mp3Artist> getArtistDetails(String slug) async {
    return await _remoteRepository.getArtistBySlug(slug:slug);
  }

  @override
  Future<List<Mp3Album>> getArtistAlbums( {required String slug, int page = 1, int limit = 20}) async {
    return await _remoteRepository.getArtistAlbums(slug:slug, limit: limit, page: page);
  }

  @override
  Future<List<Mp3Music>> getArtistTracks(String slug, {int page = 1, int pageSize = 20}) async {
    return await _remoteRepository.getArtistTracks(slug: slug, limit: pageSize, page: page);
  }

  @override
  Future<List<Mp3Artist>> getPopularArtists({int page = 0, int pageSize = 20}) async {

    throw UnimplementedError(
        "Popular artists not implemented in this example.");
  }

  @override
  Future<List<Mp3Artist>> searchArtists(String searchTerm, {int page = 1, int pageSize = 20}) async {
    return await _remoteRepository.fetchArtists(search: searchTerm, limit: pageSize, page: page);
  }

  @override
  Future<void> syncData() async {
    // Without local storage, syncing isn't necessary. This method can be left empty or removed.
  }

  @override
  Future<bool> needsUpdate() async {
    // Without local caching, we always need fresh data from the server.
    return true;
  }

  @override
  Future<void> clearCache() async {
    // Without local storage, clearing cache isn't necessary. This method can be left empty or removed.
  }

  @override
  Future<void> preloadCache() async {
    // Without local storage, preloading isn't possible. This method can be left empty or removed.
  }
}