
import 'package:isar/isar.dart';
import 'mp3_album_release.dart';

abstract interface class Mp3AlbumReleaseLocalRepository {
  static const int DEFAULT_PAGE_SIZE = 20;

  Future<List<Mp3AlbumRelease>> getAll({int page = 0, int pageSize = DEFAULT_PAGE_SIZE});
  Future<Mp3AlbumRelease?> getById(int id);
  Future<void> save(Mp3AlbumRelease albumRelease);
  Future<void> saves(List<Mp3AlbumRelease> albumReleases);
  Future<void> update(Mp3AlbumRelease albumRelease);
  Future<void> delete(Id id);
  Future<void> deleteAllAl();

  Future<List<Mp3AlbumRelease>> search(
      String searchTerm,
      {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}
      );

  Future<bool> albumExists(int id);
  Future<int> countAll();

}