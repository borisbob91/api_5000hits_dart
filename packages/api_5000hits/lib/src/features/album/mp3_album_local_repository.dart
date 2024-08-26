part of 'mp3_album_repository.dart';

class Mp3AlbumLocalRepository {
  final DatabaseInterface<Mp3Album> databaseClient;

  Mp3AlbumLocalRepository({required this.databaseClient});

  Future<List<Mp3Album>> getAllAlbums() async {

    return await databaseClient.getAll();
  }

  Future<Mp3Album?> getAlbumBySlug(String slug) async {
    final albums = await databaseClient.search(slug);
    return albums.isNotEmpty ? albums.first : null;
  }

  Future<void> saveAlbum(Mp3Album album) async {
    await databaseClient.create(album);
  }

  Future<void> updateAlbum(Mp3Album album) async {
    await databaseClient.update(album);
  }

  Future<void> deleteAlbum(int id) async {
    await databaseClient.delete(id);
  }

  Future<void> clearAllAlbums() async {
    await databaseClient.clear();
  }
}
