import 'package:api_5000hits/src/features/album/mp3_album.dart';
import 'package:api_5000hits/src/features/artist/mp3_artist.dart';
import 'package:api_5000hits/src/features/artist/mp3_artist_remote_repository_impl.dart';
import 'package:api_5000hits/src/features/artist/mp3_artist_service_impl.dart';
import 'package:api_5000hits/src/features/music/mp3_music.dart';
import 'package:api_5000hits/src/utils/api_client.dart';

import 'src/features/artist/artist_service_interface.dart';

class ArtistContrat implements Mp3ArtistService {
  static ArtistContrat? _instance;
 late final Mp3ArtistService _service;
  factory ArtistContrat() {
    if (_instance == null) {
      print('ArtistContrat initialization');
      final remoteRepo = Mp3ArtistRemoteRepositoryImplement(ApiClient());
      _instance = ArtistContrat._internal(remoteRepository: remoteRepo);
    }
    return _instance!;
  }

  ArtistContrat._internal({required Mp3ArtistRemoteRepositoryImplement remoteRepository})
  {
    _service = Mp3ArtistServiceImpl(remoteRepository);
  }

  @override
  Future<void> clearCache()async {
   return await _service.clearCache();
  }

  @override
  Future<List<Mp3Album>> getArtistAlbums({required String slug, int page = 0, int limit = 20}) async{
    return await _service.getArtistAlbums(slug: slug, page: page, limit: limit);
  }

  @override
  Future<Mp3Artist> getArtistDetails(String slug) async{
   return await _service.getArtistDetails(slug);
  }

  @override
  Future<List<Mp3Music>> getArtistTracks(String slug, {int page = 0, int pageSize = 20})async {
    return await _service.getArtistTracks(slug, pageSize: pageSize, page: page);
  }

  @override
  Future<List<Mp3Artist>> getArtists({int page = 0, int pageSize = 20, String? name, String? country, String? search})async {
   return await _service.getArtists(search: search, name: name, country:country, page: page, pageSize: pageSize);
  }

  @override
  Future<List<Mp3Artist>> getPopularArtists({int page = 0, int pageSize = 20}) {
    return _service.getPopularArtists(pageSize: pageSize, page: page);
  }

  @override
  Future<bool> needsUpdate() async{
   return await _service.needsUpdate();
  }

  @override
  Future<void> preloadCache() async{
    return await _service.preloadCache();
  }

  @override
  Future<List<Mp3Artist>> searchArtists(String searchTerm, {int page = 0, int pageSize = 20}) async{
    return await _service.searchArtists(searchTerm, page: page, pageSize: pageSize);
  }

  @override
  Future<void> syncData() async{
    return await _service.syncData();
  }

}