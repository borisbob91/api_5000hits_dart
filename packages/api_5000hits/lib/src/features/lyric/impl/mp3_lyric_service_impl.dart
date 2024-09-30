import 'package:api_5000hits/src/features/lyric/mp3_lyric.dart';
import 'package:api_5000hits/src/features/lyric/mp3_lyric_remote_repository.dart';

import '../mp3_lyric_local_repository.dart';
import '../mp3_lyric_service.dart';

class Mp3LyricServiceImpl implements Mp3LyricService{
  final Mp3LyricRemoteRepository _remoteRepository;
  final Mp3LyricLocalRepository _localRepository;

  Mp3LyricServiceImpl(this._remoteRepository,this._localRepository);

  @override
  Future<List<Mp3Lyric>> getLyrics({
    String? search,
    int? country,
    String? title,
    String? artist,
    String? genre,
    int limit = 20,
    int page = 0
  }) async {
    return await _remoteRepository.fetchLyrics(
      search: search,
      country: country,
      title: title,
      artist: artist,
      genre: genre,
      limit: limit,
      page: page,
    );
  }

  @override
  Future<Mp3Lyric> getLyricBySlug(String slug) async {
    return await _remoteRepository.getLyricBySlug(slug);
  }

  @override
  Future<void> saveOrUpdateLyric(Mp3Lyric lyric) async{
    return await _localRepository.saveOrUpdateLyric(lyric);
  }

  @override
  Future<void> clearCache() {
    return _localRepository.deleteAllLyrics();
  }

  @override
  Future<void> deleteLyric({required String slug}) {
    return _localRepository.deleteLyric(slug: slug);
  }

}