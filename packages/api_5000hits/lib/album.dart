
import 'package:api_5000hits/src/album/mp3_album.dart';
import 'src/album/mp3_album_base_service.dart';


class Album{
static final Mp3AlbumBaseService _mp3albumBaseService = Mp3AlbumBaseService.instance;

  Future<List<Mp3Album>> fetchAlbumsList() async {
      return await _mp3albumBaseService.fetchAlbums();
  }
  Future<Mp3Album> fetchAlbumBySlug(String slug) async {
  return await _mp3albumBaseService.getAlbumBySlug(slug);
  }
  Future<List<Mp3Album>> fetchNextAlbum() async{
    return await _mp3albumBaseService.fetchAlbumsNext();
  }
}


