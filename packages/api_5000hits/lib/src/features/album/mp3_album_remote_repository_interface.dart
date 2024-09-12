

import 'package:api_5000hits/api_5000hits.dart';

import 'mp3_album.dart';

abstract class Mp3RemoteRepositoryInterface {
  final String route= '/api/v1/albums';
  // Album-related methods
  Future<List<Mp3Album>> fetchAlbums({
    String? artist,
    String? slug,
    String? name,
    String? year,
    String? genre,
    String? label,
    int? country,
    String? search,
    int? limit,
    int? offset,
  });

  Future<Mp3Album> getAlbumBySlug(String slug);
  Future<List<Mp3Music>> getAlbumTracks(String slug);
  Future<List<Mp3Album>> fetchNextAlbums();
  Future<List<Mp3Album>> simularsMusics( String slug,{int page = 0, int pageSize = 20});
  Future<List<Mp3Album>> mostDownloadAlbums();
  Future<List<Mp3Album>> popularsAlbums({int page = 0, int pageSize = 20});
  bool canFetchNext();
}