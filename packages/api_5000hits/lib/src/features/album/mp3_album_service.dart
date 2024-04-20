part of 'mp3_album_base_service.dart';


abstract class Mp3AlbumService {
  late final Mp3AlbumRepository _mp3AlbumRepository;
  Future<List<Mp3Album>> fetchAlbums();
  Future<List<Mp3Album>> fetchAlbumsNext();

  Future<Mp3Album> getAlbumBySlug(String slug);

}