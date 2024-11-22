import 'dart:async';
import 'dart:collection';
import 'dart:math' show pow;

import '../download_info.dart';
import '../interfaces.dart';

class DownloadQueueManager implements DownloadQueueManagerInterface {
  final DownloadManagerInterface _downloadManager;
  final Queue<DownloadInfo> _queue = Queue<DownloadInfo>();
  final Queue<DownloadInfo> _failedQueue = Queue<DownloadInfo>();
  bool _isProcessing = false;
  final _downloadStreamController = StreamController<DownloadInfo>.broadcast();

  DownloadQueueManager(this._downloadManager);

  Stream<DownloadInfo> get downloadStream => _downloadStreamController.stream;

  @override
  Future<void> addToQueue(String slug, String savePath, String? coverPath) async {
    _queue.add(DownloadInfo(slug, savePath, coverPath));
    _checkAndProcessQueue();
  }

  @override
  Future<void> removeFromQueue(String slug) async {
    _queue.removeWhere((element) => element.slug == slug);
  }

  @override
  List<String> getQueue() {
    return _queue.map((e) => e.slug).toList();
  }

  @override
  Future<void> processQueue() async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      while (_queue.isNotEmpty) {
        final download = _queue.first;
        final maxRetries = 3;
        var retryCount = 0;

        while (retryCount < maxRetries) {
          try {
            await _downloadManager.downloadMusic(
                download.slug,
                download.filePath,
                download.coverPath,
                    (info) {
                  download.progress = info.progress;
                  download.status = info.status;
                  download.totalBytes = info.totalBytes;
                  download.downloadedBytes = info.downloadedBytes;
                  _notifyListeners(download);
                }
            );

            _queue.removeFirst();
            download.status = DownloadStatus.completed;
            _notifyListeners(download);
            break;
          } catch (e) {
            retryCount++;
            print('Erreur lors du téléchargement de ${download.slug}: $e (Tentative $retryCount/$maxRetries)');

            if (retryCount >= maxRetries) {
              download.status = DownloadStatus.failed;
              _notifyListeners(download);
              _queue.removeFirst();
              _failedQueue.add(download);
            } else {
              await Future.delayed(Duration(seconds: pow(2, retryCount).toInt()));
            }
          }
        }

        await Future.delayed(Duration(milliseconds: 500));
      }
    } finally {
      _isProcessing = false;
      _checkAndProcessQueue();
    }
  }

  void _notifyListeners(DownloadInfo download) {
    final downloadInfo = DownloadInfo(download.slug, download.filePath, download.coverPath)
      ..status = download.status
      ..progress = download.progress
      ..totalBytes = download.totalBytes
      ..downloadedBytes = download.downloadedBytes;

    _downloadStreamController.add(downloadInfo);
  }
 void notifier(DownloadInfo queuedDownload) {
    _notifyListeners(queuedDownload);
 }

  void _checkAndProcessQueue() {
    if (!_isProcessing && _queue.isNotEmpty) {
      processQueue();
    }
  }

  List<DownloadInfo> getFailedDownloads() {
    return _failedQueue.map((download) => DownloadInfo(download.slug, download.filePath, download.coverPath)
      ..status = download.status
      ..progress = download.progress
      ..totalBytes = download.totalBytes
      ..downloadedBytes = download.downloadedBytes
    ).toList();
  }

  Future<void> retryFailedDownloads() async {
    while (_failedQueue.isNotEmpty) {
      final failedDownload = _failedQueue.removeFirst();
      await addToQueue(failedDownload.slug, failedDownload.filePath, failedDownload.coverPath);
    }
  }

  void dispose() {
    _downloadStreamController.close();
  }
}
