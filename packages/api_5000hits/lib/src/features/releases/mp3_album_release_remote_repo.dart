import 'package:api_5000hits/src/features/releases/mp3_album_release.dart';

abstract interface class Mp3AlbumReleaseRemoteRepository {
  final String route = '/api/v1/albums-releases';

  Future<List<Mp3AlbumRelease>> fetchAlbumReleases({
    String? search,
    int? limit,
    int? offset,
  });

  Future<Mp3AlbumRelease> getAlbumById(int id);
}