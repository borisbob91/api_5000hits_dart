
import 'package:api_5000hits/src/utils/api_client.dart';

import '../../../core/databases/isar_manager.dart';
import '../download_info.dart';
import '../interfaces.dart';
import 'ConcurrentDownloadManager.dart';
import 'mp3_download_manager.dart';
import 'DownloadQueueManager.dart';
import 'DownloadStorage.dart';
import 'Downloader.dart';
import 'singature.dart';

class _DownloadManager {
  final DownloaderInterface _downloader;
  final DownloadQueueManager _queueManager;
  final DownloadStorage _storage;
  final ConcurrentDownloadManager _concurrentManager;

  _DownloadManager._({
    required DownloaderInterface downloader,
    required DownloadQueueManager queueManager,
    required DownloadStorage storage,
    required ConcurrentDownloadManager concurrentManager,
  }) :
        _downloader = downloader,
        _queueManager = queueManager,
        _storage = storage,
        _concurrentManager = concurrentManager;

  static Future<_DownloadManager> create({
    required String apiKey,
    required String baseUrl,
    required IsarManager isarManager,
    int maxConcurrentDownloads = 3,
  }) async {
    final signatureGenerator = SignatureGenerator(apiKey);
    final downloader = Downloader(signatureGenerator, baseUrl, ApiClient());
    final storage = DownloadStorage(isarManager);
    final baseManager = Mp3DownloadManager(downloader);
    final queueManager = DownloadQueueManager(baseManager);
    final concurrentManager = ConcurrentDownloadManager(baseManager, maxConcurrentDownloads: maxConcurrentDownloads);

    return _DownloadManager._(
      downloader: downloader,
      queueManager: queueManager,
      storage: storage,
      concurrentManager: concurrentManager,
    );
  }

  Future<void> addDownload(String slug, String savePath, String? coverPath) async {
    await _queueManager.addToQueue(slug, savePath, coverPath);
    final downloadInfo = DownloadInfo(slug, savePath, coverPath);
    await _storage.saveDownloadInfo(downloadInfo);
  }

  Future<void> cancelDownload(String slug) async {
    await _queueManager.removeFromQueue(slug);
    await _storage.updateDownloadStatus(slug, DownloadStatus.cancelled);
    await _storage.deleteDownloadInfo(slug);
  }

  Future<DownloadInfo?> getDownloadInfo(String slug) async {
    return await _storage.getDownloadInfo(slug);
  }

  List<String> getCurrentQueue() {
    return _queueManager.getQueue();
  }

  Future<List<DownloadInfo>> getAllDownloads() async {
    return await _storage.getAllDownloads();
  }

  Stream<DownloadInfo> get downloadUpdates => _queueManager.downloadStream;

  Future<void> setMaxConcurrentDownloads(int max) async {
    await _concurrentManager.setMaxConcurrentDownloads(max);
  }

  int get maxConcurrentDownloads => _concurrentManager.maxConcurrentDownloads;

  int get currentConcurrentDownloads => _concurrentManager.currentConcurrentDownloads;

  void dispose() {
    _queueManager.dispose();
  }

  // Nouvelles méthodes utilisant le stockage
  Future<void> updateDownloadProgress(String slug, double progress, int downloadedBytes, int totalBytes) async {
    final downloadInfo = await _storage.getDownloadInfo(slug);
    if (downloadInfo != null) {
      downloadInfo.progress = progress;
      downloadInfo.downloadedBytes = downloadedBytes;
      downloadInfo.totalBytes = totalBytes;
      await _storage.saveDownloadInfo(downloadInfo);
    }
  }

  Future<void> updateDownloadStatus(String slug, DownloadStatus status) async {
    await _storage.updateDownloadStatus(slug, status);
  }

  Future<List<DownloadInfo>> getDownloadsByStatus(DownloadStatus status) async {
    return await _storage.getDownloadsByStatus(status);
  }

  Future<void> cleanupCompletedDownloads() async {
    final completedDownloads = await _storage.getDownloadsByStatus(DownloadStatus.completed);
    for (var download in completedDownloads) {
      // Vous pouvez ajouter une logique ici pour décider si le téléchargement doit être supprimé
      // Par exemple, supprimer les téléchargements terminés il y a plus de 7 jours
      await _storage.deleteDownloadInfo(download.slug);
    }
  }

  Future<void> resumeDownload(String slug) async {
    final downloadInfo = await _storage.getDownloadInfo(slug);
    if (downloadInfo == null) {
      throw Exception('Download info not found for slug: $slug');
    }

    final url = _downloader.getDownloadUrl(slug);
    final savePath = downloadInfo.filePath;
    final startByte = downloadInfo.downloadedBytes;

    try {
      await _downloader.resumeDownload(
        url,
        savePath,
        startByte,
            (received, total) async {
          downloadInfo.progress = received / total;
          downloadInfo.downloadedBytes = received;
          downloadInfo.totalBytes = total;
          downloadInfo.status = DownloadStatus.downloading;
          await _storage.saveDownloadInfo(downloadInfo);
          _queueManager.notifier(downloadInfo);
        },
      );

      downloadInfo.status = DownloadStatus.completed;
      await _storage.saveDownloadInfo(downloadInfo);
      _queueManager.notifier(downloadInfo);
    } catch (e) {
      downloadInfo.status = DownloadStatus.failed;
      await _storage.saveDownloadInfo(downloadInfo);
      _queueManager.notifier(downloadInfo);
      rethrow;
    }
  }

  Future<void> pauseDownload(String slug) async {
    final downloadInfo = await _storage.getDownloadInfo(slug);
    if (downloadInfo == null) {
      throw Exception('Download info not found for slug: $slug');
    }

    final url = _downloader.getDownloadUrl(slug);
    await _downloader.pauseDownload(url);

    downloadInfo.status = DownloadStatus.paused;
    await _storage.saveDownloadInfo(downloadInfo);
    _queueManager.notifier(downloadInfo);
  }

  String getDownloadUrl(String slug) {
    return _downloader.getDownloadUrl(slug);
  }

  Future<void> downloadFile(String slug, String savePath, String? coverPath, Function(int, int) onProgress) async {
    final url = _downloader.getDownloadUrl(slug);
    final downloadInfo = DownloadInfo(slug, savePath, coverPath);
    await _storage.saveDownloadInfo(downloadInfo);

    try {
      downloadInfo.status = DownloadStatus.downloading;
      await _storage.saveDownloadInfo(downloadInfo);
      _queueManager.notifier(downloadInfo);

      await _downloader.downloadFile(
        url,
        savePath,
            (received, total) async {
          downloadInfo.progress = received / total;
          downloadInfo.downloadedBytes = received;
          downloadInfo.totalBytes = total;
          await _storage.saveDownloadInfo(downloadInfo);
          _queueManager.notifier(downloadInfo);
          onProgress(received, total);
        },
      );

      downloadInfo.status = DownloadStatus.completed;
      await _storage.saveDownloadInfo(downloadInfo);
      _queueManager.notifier(downloadInfo);
    } catch (e) {
      downloadInfo.status = DownloadStatus.failed;
      await _storage.saveDownloadInfo(downloadInfo);
      _queueManager.notifier(downloadInfo);
      rethrow;
    }
  }


}


class DownloadManagerFactory {
  static Future<_DownloadManager> create({
    required String apiKey,
    required String baseUrl,
    required IsarManager isarManager,
    int maxConcurrentDownloads = 3,
  }) async {
    return await _DownloadManager.create(
      apiKey: apiKey,
      baseUrl: baseUrl,
      isarManager: isarManager,
      maxConcurrentDownloads: maxConcurrentDownloads,
    );
  }
}

class DownloadModule {
  static DownloadModule? _instance;
  final _DownloadManager _downloadManager;

  DownloadModule._(this._downloadManager);

  static Future<DownloadModule> initialize({
    required String apiKey,
    required String baseUrl,
    required IsarManager isarManager,
    int maxConcurrentDownloads = 3,
  }) async {
    if (_instance == null) {
      final manager = await DownloadManagerFactory.create(
        apiKey: apiKey,
        baseUrl: baseUrl,
        isarManager: isarManager,
        maxConcurrentDownloads: maxConcurrentDownloads,
      );
      _instance = DownloadModule._(manager);
    }
    return _instance!;
  }

  static DownloadModule get instance {
    if (_instance == null) {
      throw Exception('DownloadModule not initialized. Call initialize() first.');
    }
    return _instance!;
  }

  // Méthodes de téléchargement
  Future<void> downloadFile(String slug, String savePath, String? coverPath, Function(int, int) onProgress) {
    return _downloadManager.downloadFile(slug, savePath, coverPath, onProgress);
  }

  Future<void> pauseDownload(String slug) {
    return _downloadManager.pauseDownload(slug);
  }

  Future<void> resumeDownload(String slug) {
    return _downloadManager.resumeDownload(slug);
  }

  Future<void> cancelDownload(String slug) {
    return _downloadManager.cancelDownload(slug);
  }

  // Méthodes d'information
  Future<DownloadInfo?> getDownloadInfo(String slug) {
    return _downloadManager.getDownloadInfo(slug);
  }

  Future<List<DownloadInfo>> getAllDownloads() {
    return _downloadManager.getAllDownloads();
  }

  Stream<DownloadInfo> get downloadUpdates => _downloadManager.downloadUpdates;

  List<String> getCurrentQueue() {
    return _downloadManager.getCurrentQueue();
  }

  // Gestion de la concurrence
  Future<void> setMaxConcurrentDownloads(int max) {
    return _downloadManager.setMaxConcurrentDownloads(max);
  }

  int get maxConcurrentDownloads => _downloadManager.maxConcurrentDownloads;
  int get currentConcurrentDownloads => _downloadManager.currentConcurrentDownloads;

  void dispose() {
    _downloadManager.dispose();
    _instance = null;
  }
}