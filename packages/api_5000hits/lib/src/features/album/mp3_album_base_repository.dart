part of 'mp3_album_repository.dart';

abstract class Mp3AlbumRepositoryInterface {
  Future<List<Mp3Album>> fetchAlbums();
  Future<List<Mp3Album>> fetchNextAlbums();
  Future<Mp3Album> getAlbumBySlug(String slug);
  bool canFetchNext();

}
