import 'package:api_5000hits/src/features/lyric/impl/mp3_lyric_service_impl.dart';
import 'package:api_5000hits/src/features/lyric/mp3_lyric_service.dart';
import 'package:api_5000hits/src/utils/api_client.dart';

import 'src/core/databases/isar_manager.dart';
import 'src/features/lyric/impl/mp3_liryc_local_repository_impl.dart';
import 'src/features/lyric/impl/mp3_lyric_remote_repository_impl.dart';
import 'src/features/lyric/mp3_lyric.dart';

class LyricContrat implements Mp3LyricService {
  static LyricContrat? _instance;
  static Mp3LyricService? _lyricService;

  factory LyricContrat() {
    if (_instance == null) {
      print('LyricContrat initialization');
      final apiClient = ApiClient();
      final remoteRepo = Mp3LyricRemoteRepositoryImpl(apiClient);
      final localRepo = Mp3LyricLocalRepositoryImpl(isarManager: IsarManager());
      _instance = LyricContrat._internal(remoteRepository: remoteRepo, localRepository: localRepo);
    }
    return _instance!;
  }

  LyricContrat._internal({required Mp3LyricRemoteRepositoryImpl remoteRepository, required Mp3LyricLocalRepositoryImpl localRepository}) {
     _lyricService = Mp3LyricServiceImpl(remoteRepository, localRepository);
  }

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
    return await _lyricService!.getLyrics(
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
  Future<void> clearCache() {
    return _lyricService!.clearCache();
  }

  @override
  Future<void> deleteLyric({required String slug}) async{
   return await _lyricService?.deleteLyric(slug: slug);
  }

  @override
  Future<Mp3Lyric> getLyricBySlug(String slug) async{
   return await _lyricService!.getLyricBySlug(slug);
  }

  @override
  Future<void> saveOrUpdateLyric(Mp3Lyric lyric) async{
   _lyricService?.saveOrUpdateLyric(lyric);
  }

}