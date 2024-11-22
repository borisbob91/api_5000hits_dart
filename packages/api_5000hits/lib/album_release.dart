import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:api_5000hits/src/features/releases/impl/mp3_album_release_local_repositoryImpl.dart';
import 'package:api_5000hits/src/features/releases/impl/mp3_album_release_remote_repositoryImpl.dart';
import 'package:api_5000hits/src/features/releases/mp3_album_release.dart';
import 'package:api_5000hits/src/features/releases/mp3_release_service.dart';
import 'package:api_5000hits/src/utils/api_client.dart';
import 'package:flutter/material.dart';

import 'src/utils/cache_timestamp.dart';

class AlbumReleaseContrat implements Mp3AlbumReleaseServiceInterface {
  static AlbumReleaseContrat? _instance;
  final Mp3AlbumReleaseServiceInterface _service;

  factory AlbumReleaseContrat() {
    return _instance ??= AlbumReleaseContrat._create();
  }

  factory AlbumReleaseContrat._create() {
    final isarManager = IsarManager();
    final apiClient = ApiClient();

    final localDb = Mp3AlbumReleaseLocalRepositoryImpl(isarManager: isarManager);
    final remoteDb = Mp3AlbumReleaseRemoteRepositoryImpl(apiClient: apiClient);
    final cache = CacheService.instance;

    return AlbumReleaseContrat._internal(
        Mp3AlbumReleaseServiceImpl(localDb, remoteDb, cache)
    );

  }

  AlbumReleaseContrat._internal(this._service);

  // Pour les tests
  @visibleForTesting
  static void resetInstance() {
    _instance = null;
  }

  @override
  Future<void> clearCache() => _service.clearCache();

  @override
  Future<Mp3AlbumRelease> getAlbumReleaseDetails(int id) async {
    return await _service.getAlbumReleaseDetails(id);
  }

  @override
  Future<List<Mp3AlbumRelease>> getAlbumReleases({
    int page = 0,
    int pageSize = 20,
    String? search
  }) async {
    return await _service.getAlbumReleases(
        page: page,
        pageSize: pageSize,
        search: search
    );
  }

  @override
  Future<bool> needsUpdate() async {
    return await _service.needsUpdate();
  }

  @override
  Future<void> preloadCache() async {
    return await _service.preloadCache();
  }

  @override
  Future<void> syncData() async {
    return await _service.syncData();
  }
}



