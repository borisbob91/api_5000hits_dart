import 'mp3_album.dart';
import 'mp3_album_repository.dart' hide Mp3AlbumRepositoryInterface;

part 'mp3_album_service.dart';
class Mp3AlbumBaseService implements Mp3AlbumService{
  @override
  late final Mp3AlbumRepository _mp3AlbumRepository;
  static Mp3AlbumBaseService instance = Mp3AlbumBaseService._internal();

  factory Mp3AlbumBaseService() => instance;

  Mp3AlbumBaseService._internal(){
   _mp3AlbumRepository =  Mp3AlbumRepository();
  }

  @override
  Future<List<Mp3Album>> fetchAlbums() async {
    try {
      return await _mp3AlbumRepository.fetchAlbums();
    } catch (error) {
      throw Exception('Failed to fetch service: $error');
    }
  }

  @override
   Future<Mp3Album> getAlbumBySlug(String slug) async {
    try {
      print("slug:=> $slug");
      Mp3Album mp3Album = await _mp3AlbumRepository.getAlbumBySlug(slug);
      print('object: $mp3Album');
      return mp3Album;
    } catch (error) {
      throw Exception('Failed to fetch album by slug: $error');
    }
  }

  @override
  Future<List<Mp3Album>> fetchAlbumsNext() async{
    return _mp3AlbumRepository.fetchNextAlbums();
  }
}
