import 'package:api_5000hits/src/features/releases/mp3_album_release.dart';
import 'package:api_5000hits/src/features/releases/mp3_album_release_local_repo.dart';
import 'package:api_5000hits/src/features/releases/mp3_album_release_remote_repo.dart';
import 'package:api_5000hits/src/utils/cache_timestamp.dart';

abstract class Mp3AlbumReleaseServiceInterface {
  Future<List<Mp3AlbumRelease>> getAlbumReleases({int page = 0, int pageSize = 20, String? search});
  Future<Mp3AlbumRelease> getAlbumReleaseDetails(int id);
  Future<void> syncData();
  Future<bool> needsUpdate();
  Future<void> clearCache();
  Future<void> preloadCache();
}

class Mp3AlbumReleaseServiceImpl implements Mp3AlbumReleaseServiceInterface {
  final Mp3AlbumReleaseRemoteRepository _remoteRepository;
  final Mp3AlbumReleaseLocalRepository _localRepository;
  final CacheService _cacheService;

  Mp3AlbumReleaseServiceImpl(
      this._localRepository,
      this._remoteRepository,
      this._cacheService
      );

  @override
  Future<List<Mp3AlbumRelease>> getAlbumReleases({
    int page = 0,
    int pageSize = 20,
    String? search
  }) async {
    try {
      print('getAlbumReleases');
      final cache = await _cacheService.shouldUseCache();
      print('cache: $cache');
      if (cache) {
        print('---------------------should used cache !');
        if (search != null && search.isNotEmpty) {
          final result = await _localRepository.search(search, page: page, pageSize: pageSize);
          if (result.isEmpty || result.length < pageSize) {
          final newResult =  await _remoteRepository.fetchAlbumReleases(
                search: search,
                offset: page * pageSize,
                limit: pageSize
            );
          await _localRepository.saves(newResult);
          newResult.addAll(result);
          return newResult;
          }
          return result;
        }
        print('---------------------should  used cache !');
        return await _localRepository.getAll(page: page, pageSize: pageSize);
      }

      final remoteReleases = await _remoteRepository.fetchAlbumReleases(
          search: search,
          offset: page * pageSize,
          limit: pageSize
      );
      print('remoteReleases: $remoteReleases');
      _localRepository.saves(remoteReleases);
      //await _cacheService.updateLastUpdateTime();
      return remoteReleases;
    } catch (e) {
      if (search != null && search.isNotEmpty) {
        return await _localRepository.search(search, page: page, pageSize: pageSize);
      }
      return await _localRepository.getAll(page: page, pageSize: pageSize);
    }
  }

  @override
  Future<Mp3AlbumRelease> getAlbumReleaseDetails(int id) async {
    try {
      //final cache = await _cacheService.shouldUseCache();
      // if (cache) {
      //   final cachedRelease = await _localRepository.getById(id);
      //   if (cachedRelease != null) {
      //     return cachedRelease;
      //   }
      // }

      final remoteRelease = await _remoteRepository.getAlbumById(id);
      await _localRepository.save(remoteRelease);
      return remoteRelease;
    } catch (e) {
      final localRelease = await _localRepository.getById(id);
      if (localRelease != null) {
        return localRelease;
      }
      rethrow;
    }
  }

  @override
  Future<void> syncData() async {
    try {
      final remoteReleases = await _remoteRepository.fetchAlbumReleases(limit: 100);
      await _localRepository.saves(remoteReleases);
      await _cacheService.updateLastUpdateTime();
    } catch (e) {
      print('Error during sync: $e');
    }
  }

  @override
  Future<bool> needsUpdate() async {
    return !(await _cacheService.shouldUseCache());
  }

  @override
  Future<void> clearCache() async {
    await _localRepository.deleteAllAl();
  }

  @override
  Future<void> preloadCache() async {
    try {
      if (await _cacheService.shouldUseCache()) {
        return;
      }
      final popularReleases = await _remoteRepository.fetchAlbumReleases(limit: 100);
      await _localRepository.saves(popularReleases);
       _cacheService.activateCache();
      print('Preload cache done');
    } catch (e) {
      print('Error preloading cache: $e');
    }
  }
}