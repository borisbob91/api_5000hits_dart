import 'dart:async';
import 'dart:collection';

import '../download_info.dart';
import '../interfaces.dart';

class ConcurrentDownloadManager implements ConcurrentDownloadManagerInterface, DownloadManagerInterface {
  final DownloadManagerInterface _baseManager;
  int _maxConcurrentDownloads;
  int _currentDownloads = 0;
  final Queue<_QueuedDownload> _downloadQueue = Queue<_QueuedDownload>();

  ConcurrentDownloadManager(this._baseManager, {int maxConcurrentDownloads = 3})
      : _maxConcurrentDownloads = maxConcurrentDownloads;

  @override
  Future<void> setMaxConcurrentDownloads(int max) async {
    _maxConcurrentDownloads = max;
    _processQueue();
  }

  @override
  int get maxConcurrentDownloads => _maxConcurrentDownloads;

  @override
  int get currentConcurrentDownloads => _currentDownloads;

  @override
  Future<void> downloadMusic(String slug, String savePath, String? coverPath, Function(DownloadInfo) onProgressUpdate) async {
    if (_currentDownloads < _maxConcurrentDownloads) {
      _currentDownloads++;
      try {
        await _baseManager.downloadMusic(slug, savePath, coverPath, onProgressUpdate);
      } finally {
        _currentDownloads--;
        _processQueue();
      }
    } else {
      _enqueueDownload(slug, savePath, coverPath, onProgressUpdate);
    }
  }

  void _enqueueDownload(String slug, String savePath, String? coverPath, Function(DownloadInfo) onProgressUpdate) {
    _downloadQueue.add(_QueuedDownload(slug, savePath, coverPath, onProgressUpdate));
  }

  void _processQueue() {
    while (_currentDownloads < _maxConcurrentDownloads && _downloadQueue.isNotEmpty) {
      final download = _downloadQueue.removeFirst();
      downloadMusic(download.slug, download.savePath,download.coverPath, download.onProgressUpdate);
    }
  }

  @override
  Future<void> cancelDownload(String slug) async {
    await _baseManager.cancelDownload(slug);
    _downloadQueue.removeWhere((element) => element.slug == slug);
  }

  @override
  DownloadInfo? getDownloadInfo(String slug) => _baseManager.getDownloadInfo(slug);

  @override
  List<DownloadInfo> getAllDownloads() => _baseManager.getAllDownloads();

  @override
  Stream<DownloadInfo> get downloadStream => _baseManager.downloadStream;

  @override
  Future<void> pauseDownload(String slug) => _baseManager.pauseDownload(slug);

  @override
  Future<void> resumeDownload(String slug) => _baseManager.resumeDownload(slug);
}

class _QueuedDownload {
  final String slug;
  final String savePath;
  final String? coverPath;
  final Function(DownloadInfo) onProgressUpdate;

  _QueuedDownload(this.slug, this.savePath, this.coverPath, this.onProgressUpdate);
}