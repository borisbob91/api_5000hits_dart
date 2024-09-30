import '../mp3_music.dart';
import '../mp3_music_local_repository.dart';
import '../mp3_music_remote_repository.dart';

part '../mp3_music_service.dart';

class Mp3MusicServiceImplemente implements Mp3MusicService {
  final Mp3MusicLocalRepository _localRepository;
  final Mp3MusicRemoteRepository _remoteRepository;
   String _route = "/api/v1/music";
  int _currentOffset = 0;
  bool _hasMoreData = true;
  static const int _batchSize = 100;
  static const int _pageSize = 20;

  Mp3MusicServiceImplemente(this._localRepository, this._remoteRepository);

  @override
  Future<void> initialize() async {
    await _fetchAndStoreMusic();
  }

  @override
  Future<List<Mp3Music>> getNextPage() async {
    final localMusic = await _localRepository.getMusicByPage(page: _currentOffset , pageSize: _pageSize);
    
    if (localMusic.length < _pageSize && _hasMoreData) {
      await _fetchAndStoreMusic();
      return _localRepository.getMusicByPage(page: _currentOffset ~/ _pageSize, pageSize: _pageSize);
    }
    
    _currentOffset += localMusic.length;
    return localMusic;
  }

  @override
  void resetPagination() {
    _currentOffset = 0;
  }

  @override
  Future<bool> hasMore() async {
    return _hasMoreData || await _localRepository.countMusic() > _currentOffset;
  }

  @override
  Future<List<Mp3Music>> searchMusic(String query, {int limit = 20, int offset = 0}) async {
      final remoteResults = await _remoteRepository.searchMusic(query, limit: limit, offset: offset);
      await _localRepository.saveMusics(remoteResults);
    return remoteResults;
  }

  @override
  Future<Mp3Music?> getMusicDetails({required String slug}) async {
    var music = await _localRepository.getMusicBySlug(slug);
    if (music == null) {
      music = await _remoteRepository.getMusicBySlug(slug);
      await _localRepository.saveOrUpdateMusic(music);
        }
    return music;
  }

  @override
  Future<List<Mp3Music>> getPopularMusic({ int limit = 20, int page = 1}) async {
    List<Mp3Music> remoteResults = await _remoteRepository.getPopularMusic(limit: limit, page: page);
    await _localRepository.saveMusics(remoteResults);
    return remoteResults;
  }

  @override
  Future<List<Mp3Music>> getRecentMusic({int limit = 20, int offset = 0}) async {
    var localResults = await _localRepository.getRecentMusic(page: offset ~/ limit, pageSize: limit);
    if (localResults.length < limit) {
      final remoteResults = await _remoteRepository.getRecentMusic(limit: limit, offset: offset);
      await _localRepository.saveMusics(remoteResults);
      localResults = await _localRepository.getRecentMusic(page: offset ~/ limit, pageSize: limit);
    }
    return localResults;
  }

  @override
  Future<List<Mp3Music>> getMusicByArtist(String artist, {int limit = 20, int offset = 0}) async {
    //var localResults = await _localRepository.getMusicByArtist(artist, page: offset ~/ limit, pageSize: limit);
    List<Mp3Music> localResults = [];
    if (localResults.length < limit) {
      localResults = await _remoteRepository.getMusicByArtist(artist, limit: limit, offset: offset);
      await _localRepository.saveMusics(localResults);
    }
    return localResults;
  }

  @override
  Future<List<Mp3Music>> getMusicByAlbum(String album, {int limit = 20, int offset = 0}) async {
    var localResults = await _localRepository.getMusicByPage(page: offset ~/ limit, pageSize: limit);
    localResults = localResults.where((music) => music.album == album).toList();
    if (localResults.length < limit) {
      final remoteResults = await _remoteRepository.getMusicByAlbum(album, limit: limit, offset: offset);
      await _localRepository.saveMusics(remoteResults);
      localResults = await _localRepository.getMusicByPage(page: offset ~/ limit, pageSize: limit);
      localResults = localResults.where((music) => music.album == album).toList();
    }
    return localResults;
  }

  @override
  Future<List<Mp3Music>> getMusicByGenre(String genre, {int limit = 20, int offset = 0}) async {
    print('******** offset: $offset $limit');
    List<Mp3Music> remoteResults = await _remoteRepository.getMusicByGenre(genre, limit: limit, offset: offset);
    await _localRepository.saveMusics(remoteResults);
    return remoteResults;
  }

  @override
  Future<List<Mp3Music>> getSimilarMusic({required String musicSlug, int limit = 20}) async {
    final music = await getMusicDetails(slug: musicSlug);
    if (music != null) {
      //return _localRepository.getSimilarMusic(music, page: 0, pageSize: limit);
      return _remoteRepository.getSimilarMusic(musicSlug, limit: limit, );
    }
    return [];
  }





  Future<void> _fetchAndStoreMusic() async {
    final remoteMusic = await _remoteRepository.fetchMusic(limit: _batchSize, offset: _currentOffset);
    await _localRepository.saveMusics(remoteMusic);
    _currentOffset += remoteMusic.length;
    _hasMoreData = remoteMusic.length == _batchSize;
  }

  @override
  Future<List<Mp3Music>> getMusics({String? artist, String? name, String? year, String? genre, String? label, int? country, String? search, int? limit, int? offset}) async{
   return await _remoteRepository.fetchMusic(artist: artist,  year: year, genre: genre, country: country,  limit: limit, offset: offset, search: search);
  }
  @override
  Future<void> syncData() async {
    final remoteMusic = await _remoteRepository.fetchMusic(limit: _batchSize, offset: 0);
    await _localRepository.saveMusics(remoteMusic);
  }

  @override
  Future<void> clearCache() async {
    await _localRepository.deleteAllMusic();
    resetPagination();
    _hasMoreData = true;
  }

  @override
  Future<bool> needsUpdate() async {
    // This is a simplified check. You might want to implement a more sophisticated
    // method to determine if an update is needed, e.g., based on a timestamp.
    return await _localRepository.countMusic() == 0;
  }

  @override
  Future<void> preloadCache() async {
    await clearCache();
    await _fetchAndStoreMusic();
  }

  @override
  String get route => _route;

  @override
  Future<List<Mp3Music>> getMusicOfArtist({required musicSlug, int limit = 20, int page = 1}) async{
    return await _remoteRepository.getMusicForArtistBySlug(musicSlug: musicSlug, limit: limit, page:page);
  }
}