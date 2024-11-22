import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:api_5000hits/src/features/releases/mp3_album_release.dart';
import 'package:api_5000hits/src/features/releases/mp3_album_release_local_repo.dart';
import 'package:api_5000hits/src/features/releases/mp3_album_release_track.dart';
import 'package:isar/isar.dart';

class Mp3AlbumReleaseLocalRepositoryImpl implements Mp3AlbumReleaseLocalRepository {
  final IsarManager isarManager;

  static const int DEFAULT_PAGE_SIZE = 20;
  Mp3AlbumReleaseLocalRepositoryImpl({required this.isarManager}) {
    isarManager.initialize();
  }

  Isar get isar => isarManager.isar;

  @override
  Future<void> save(Mp3AlbumRelease albumRelease) async {
    await isar.writeTxn(() async {
      // Save tracks first
      if (albumRelease.tracks != null) {
        for (var track in albumRelease.tracks) {
          await isar.mp3AlbumReleaseTracks.put(track);
        }
      }

      // Then save the album release
      await isar.mp3AlbumReleases.put(albumRelease);
    });
  }

  @override
  Future<void> saves(List<Mp3AlbumRelease> albumReleases) async {
    await isar.writeTxn(() async {
      // Save all tracks first
      for (var release in albumReleases) {
        for (var track in release.tracks) {
          await isar.mp3AlbumReleaseTracks.put(track);
        }
            }

      // Then save all releases
      await isar.mp3AlbumReleases.putAll(albumReleases);
    });
  }

  @override
  Future<List<Mp3AlbumRelease>> getAll({
    int page = 0,
    int pageSize = DEFAULT_PAGE_SIZE
  }) async {
    return await isar.mp3AlbumReleases
        .where()
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<Mp3AlbumRelease?> getById(int id) async {
    return await isar.mp3AlbumReleases.get(id);
  }

  @override
  Future<void> update(Mp3AlbumRelease albumRelease) async {
    final existing = await getById(albumRelease.id);
    if (existing == null) {
      throw Exception('Album release not found');
    }
    await save(albumRelease);
  }

  @override
  Future<void> delete(Id id) async {
    await isar.writeTxn(() async {
      final release = await isar.mp3AlbumReleases.get(id);
      if (release?.tracks != null) {
        for (var track in release!.tracks!) {
          await isar.mp3AlbumReleaseTracks.delete(track.id);
        }
      }
      await isar.mp3AlbumReleases.delete(id);
    });
  }

  @override
  Future<void> deleteAllAl() async {
    await isar.writeTxn(() async {
      await isar.mp3AlbumReleaseTracks.clear();
      await isar.mp3AlbumReleases.clear();
    });
  }

  @override
  Future<List<Mp3AlbumRelease>> search(
      String searchTerm,
      {int page = 0, int pageSize = DEFAULT_PAGE_SIZE}
      ) async {
    return await isar.mp3AlbumReleases
        .filter()
        .artistContains(searchTerm, caseSensitive: false)
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<bool> albumExists(int id) async {
    return await isar.mp3AlbumReleases.get(id) != null;
  }

  @override
  Future<int> countAll() async {
    return await isar.mp3AlbumReleases.count();
  }
}