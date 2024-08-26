
part of 'mp3_album_remote_repository_implemente.dart';

abstract class Mp3RemoteRepositoryInterface {
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
  bool canFetchNext();
}