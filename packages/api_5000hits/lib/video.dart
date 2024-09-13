import 'package:api_5000hits/src/features/video/mp3_video.dart';
import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:api_5000hits/src/utils/api_client.xxxdart';

import 'src/features/video/impl/mp3_video_local_repository_impl.dart';
import 'src/features/video/impl/mp3_video_remote_repository_impl.dart';
import 'src/features/video/impl/mp3_video_service_impl.dart';
import 'src/features/video/mp3_video_local_repository.dart';
import 'src/features/video/mp3_video_remote_repository.dart';


class VideoContrat extends Mp3VideoServiceImpl {
  static VideoContrat? _instance;

  factory VideoContrat() {
    if (_instance == null) {
      print('video contrat init');
      final isarManager = IsarManager();
      final apiClient = ApiClient();

      final localDb = Mp3VideoLocalRepositoryImpl(isarManager: isarManager);
      final remoteDb = Mp3VideoRemoteRepositoryImpl(apiClient: apiClient);

      _instance = VideoContrat._internal(remoteRepository: remoteDb, localRepository: localDb);
    }
    return _instance!;
  }

  VideoContrat._internal({
    required Mp3VideoRemoteRepository remoteRepository,
    required Mp3VideoLocalRepository localRepository
  }) : super(localRepository, remoteRepository) {
    // Additional initialization if needed
  }

  Future<void> downloadVideo(String ytId) async {
    final video = await getVideoByYtId(ytId);
  }

  Future<List<Mp3Video>> refreshAndGetPopularVideos({int limit = 20, int offset = 0}) async {
    await syncData();
    return getPopularVideos(limit: limit, offset: offset);
  }

  // Add other specific methods for VideoContrat here
}