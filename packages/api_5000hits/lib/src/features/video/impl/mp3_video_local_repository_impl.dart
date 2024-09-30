import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:isar/isar.dart';
import '../mp3_video.dart';
import '../mp3_video_local_repository.dart';

class Mp3VideoLocalRepositoryImpl implements Mp3VideoLocalRepository {
  final IsarManager isarManager;

  Mp3VideoLocalRepositoryImpl({required this.isarManager}) {
    // isarManager.initialize();
    isarManager.addSchema(Mp3VideoSchema);
  }

  Isar get isar => isarManager.isar;

  @override
  Future<List<Mp3Video>> getAllVideos({int page = 0, int pageSize = 20}) async {
    return await isar.mp3Videos
        .where()
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<Mp3Video?> getVideoByYtId(String ytId) async {
    return await isar.mp3Videos.filter().ytIdEqualTo(ytId).findFirst();
  }

  @override
  Future<void> saveOrUpdateVideo(Mp3Video video) async {
    await isar.writeTxn(() async {
      await isar.mp3Videos.put(video);
    });
  }

  @override
  Future<void> saveOrUpdateVideos(List<Mp3Video> videos) async {
    await isar.writeTxn(() async {
      await isar.mp3Videos.putAll(videos);
    });
  }

  @override
  Future<void> deleteVideo(String ytId) async {
    await isar.writeTxn(() async {
      await isar.mp3Videos.filter().ytIdEqualTo(ytId).deleteAll();
    });
  }

  @override
  Future<void> deleteAllVideos() async {
    await isar.writeTxn(() async {
      await isar.mp3Videos.clear();
    });
  }

  @override
  Future<List<Mp3Video>> searchVideos(String searchTerm, {int page = 0, int pageSize = 20}) async {
    return await isar.mp3Videos
        .filter()
        .titleContains(searchTerm, caseSensitive: false)
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  @override
  Future<bool> videoExists(String ytId) async {
    return await isar.mp3Videos.filter().ytIdEqualTo(ytId).isNotEmpty();
  }

  @override
  Future<int> getVideoMusic(int videoId) async {
    final video = await isar.mp3Videos.get(videoId);
    return video?.id ?? -1; // Retourne -1 si le video n'est pas trouvé
  }
}