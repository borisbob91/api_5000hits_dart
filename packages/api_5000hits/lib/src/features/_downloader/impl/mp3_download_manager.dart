import 'dart:async';

import '../download_info.dart';
import '../interfaces.dart';

class Mp3DownloadManager implements DownloadManagerInterface {
  final DownloaderInterface _downloader;
  final Map<String, DownloadInfo> _downloads = {};
  final _downloadStreamController = StreamController<DownloadInfo>.broadcast();

  Mp3DownloadManager(this._downloader);

  @override
  Future<void> downloadMusic(String slug, String savePath, Function(DownloadInfo) onProgressUpdate) async {
    final url = _downloader.getDownloadUrl(slug);
    final downloadInfo = DownloadInfo(slug, savePath);
    _downloads[slug] = downloadInfo;

    try {
      downloadInfo.status = DownloadStatus.downloading;
      _updateDownload(downloadInfo);

      await _downloader.downloadFile(
        url,
        savePath,
        (received, total) {
          if (total != -1) {
            downloadInfo.progress = received / total;
            downloadInfo.downloadedBytes = received;
            downloadInfo.totalBytes = total;
            _updateDownload(downloadInfo);
          }
        },
      );

      downloadInfo.status = DownloadStatus.completed;
      downloadInfo.progress = 1.0;
      _updateDownload(downloadInfo);
    } catch (e) {
      downloadInfo.status = DownloadStatus.failed;
      _updateDownload(downloadInfo);
      rethrow;
    }
  }

  @override
  Future<void> resumeDownload(String slug) async {
    final downloadInfo = _downloads[slug];
    if (downloadInfo == null) return;

    final url = _downloader.getDownloadUrl(slug);

    try {
      downloadInfo.status = DownloadStatus.downloading;
      _updateDownload(downloadInfo);

      await _downloader.resumeDownload(
        url,
        downloadInfo.filePath,
        downloadInfo.downloadedBytes,
        (received, total) {
          if (total != -1) {
            downloadInfo.progress = received / total;
            downloadInfo.downloadedBytes = received;
            downloadInfo.totalBytes = total;
            _updateDownload(downloadInfo);
          }
        },
      );

      downloadInfo.status = DownloadStatus.completed;
      downloadInfo.progress = 1.0;
      _updateDownload(downloadInfo);
    } catch (e) {
      downloadInfo.status = DownloadStatus.failed;
      _updateDownload(downloadInfo);
      rethrow;
    }
  }

  @override
  Future<void> pauseDownload(String slug) async {
    final downloadInfo = _downloads[slug];
    if (downloadInfo == null) return;

    await _downloader.pauseDownload(_downloader.getDownloadUrl(slug));
    downloadInfo.status = DownloadStatus.paused;
    _updateDownload(downloadInfo);
  }

  @override
  Future<void> cancelDownload(String slug) async {
    final downloadInfo = _downloads[slug];
    if (downloadInfo == null) return;

    await _downloader.cancelDownload(_downloader.getDownloadUrl(slug));
    downloadInfo.status = DownloadStatus.cancelled;
    _updateDownload(downloadInfo);
    _downloads.remove(slug);
  }

  @override
  DownloadInfo? getDownloadInfo(String slug) => _downloads[slug];

  @override
  List<DownloadInfo> getAllDownloads() => _downloads.values.toList();

  @override
  Stream<DownloadInfo> get downloadStream => _downloadStreamController.stream;

  void _updateDownload(DownloadInfo info) {
    _downloadStreamController.add(info);
  }

  void dispose() {
    _downloadStreamController.close();
  }
}