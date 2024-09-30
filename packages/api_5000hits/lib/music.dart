import 'package:api_5000hits/src/features/music/mp3_music.dart';
import 'package:api_5000hits/src/features/music/impl/mp3_music_local_repository_implemente.dart';
import 'package:api_5000hits/src/features/music/mp3_music_local_repository.dart';
import 'package:api_5000hits/src/features/music/impl/mp3_music_remote_implemente.dart';
import 'package:api_5000hits/src/features/music/mp3_music_remote_repository.dart';
import 'package:api_5000hits/src/features/music/impl/mp3_music_service_implemente.dart';
import 'package:api_5000hits/src/utils/api_client.dart';

import 'src/core/databases/isar_manager.dart';

class MusicContrat implements Mp3MusicService {
  static MusicContrat? _instance;
  late final Mp3MusicService _service;

  factory MusicContrat() {
    if (_instance == null) {
      print('music contrat init');
      final localDb =
          Mp3MusicLocalRepositoryImplemente(isarManager: IsarManager());
      final remoteDb = Mp3MusicRemoteRepositoryImplement(ApiClient());
      _instance = MusicContrat._internal(
          remoteRepository: remoteDb, localRepository: localDb);
    }
    return _instance!;
  }

  MusicContrat._internal(
      {required Mp3MusicRemoteRepository remoteRepository,
      required Mp3MusicLocalRepository localRepository}) {
    _service = Mp3MusicServiceImplemente(localRepository, remoteRepository);
  }

  Future<void> downloadAlbum(String albumSlug) async {
    // Implémentation de la logique de téléchargement
    // Vous pouvez utiliser _localRepository et _remoteRepository ici
  }

  @override
  Future<void> clearCache() async {
    return await _service.clearCache();
  }

  @override
  Future<List<Mp3Music>> getMusicByAlbum(String album,
      {int limit = 20, int offset = 0}) {
    return _service.getMusicByAlbum(album, limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getMusicByArtist(String artist,
      {int limit = 20, int offset = 0}) {
    return _service.getMusicByArtist(artist, limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getMusicByGenre(String genre,
      {int limit = 20, int offset = 0}) {
    return _service.getMusicByGenre(genre, limit: limit, offset: offset);
  }

  @override
  Future<Mp3Music?> getMusicDetails({required String slug}) {
    return _service.getMusicDetails(slug: slug);
  }

  @override
  Future<List<Mp3Music>> getMusics(
      {String? artist,
      String? name,
      String? year,
      String? genre,
      String? label,
      int? country,
      String? search,
      int? limit,
      int? offset}) {
    return _service.getMusics(
        artist: artist,
        name: name,
        year: year,
        genre: genre,
        label: label,
        country: country,
        search: search,
        limit: limit,
        offset: offset);
  }

  @override
  Future<List<Mp3Music>> getNextPage() {
    return _service.getNextPage();
  }

  @override
  Future<List<Mp3Music>> getPopularMusic({int limit = 20, int page = 1}) {
    return _service.getPopularMusic(limit: limit, page: page);
  }

  @override
  Future<List<Mp3Music>> getRecentMusic({int limit = 20, int offset = 0}) {
    return _service.getRecentMusic(limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getSimilarMusic(
      {required String musicSlug, int limit = 20}) {
    return _service.getSimilarMusic(musicSlug: musicSlug, limit: limit);
  }

  @override
  Future<bool> hasMore() {
    return _service.hasMore();
  }

  @override
  Future<void> initialize() {
    return _service.initialize();
  }

  @override
  Future<bool> needsUpdate() {
    return _service.needsUpdate();
  }

  @override
  Future<void> preloadCache() {
    return _service.preloadCache();
  }

  @override
  void resetPagination() {
    _service.resetPagination();
  }

  @override
  Future<List<Mp3Music>> searchMusic(String query,
      {int limit = 20, int offset = 0}) {
    return _service.searchMusic(query, limit: limit, offset: offset);
  }

  @override
  Future<void> syncData() {
    return _service.syncData();
  }

  @override
  Future<List<Mp3Music>> getMusicOfArtist({required musicSlug, int limit = 20, int page = 1}) async{
    return await _service.getMusicOfArtist(musicSlug: musicSlug, limit: limit, page: page);
  }

  @override
  // TODO: implement route
  String get route => throw UnimplementedError();
}
