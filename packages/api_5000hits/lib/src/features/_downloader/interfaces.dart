import 'dart:async';

import 'download_info.dart';

abstract class DownloaderInterface {
  Future<void> downloadFile(String url, String savePath, Function(int, int) onProgress);
  Future<void> resumeDownload(String url, String savePath, int startByte, Function(int, int) onProgress);
  Future<void> pauseDownload(String url);
  Future<void> cancelDownload(String url);
  String getDownloadUrl(String slug);
}

abstract class DownloadManagerInterface {
  Future<void> downloadMusic(String slug, String savePath, String? coverPath, Function(DownloadInfo) onProgressUpdate);
  Future<void> resumeDownload(String slug);
  Future<void> pauseDownload(String slug);
  Future<void> cancelDownload(String slug);
  DownloadInfo? getDownloadInfo(String slug);
  List<DownloadInfo> getAllDownloads();
  Stream<DownloadInfo> get downloadStream;
}

abstract class SignatureGeneratorInterface {
  String generateSignature(String slug, int timestamp);
}

abstract class ConcurrentDownloadManagerInterface {
  Future<void> setMaxConcurrentDownloads(int max);
  int get maxConcurrentDownloads;
  int get currentConcurrentDownloads;
}

abstract class DownloadQueueManagerInterface {
  Future<void> addToQueue(String slug, String savePath, String? coverPath);
  Future<void> removeFromQueue(String slug);
  List<String> getQueue();
  Future<void> processQueue();
}

abstract class DownloadStorageInterface {
  Future<void> saveDownloadInfo(DownloadInfo info);
  Future<DownloadInfo?> getDownloadInfo(String slug);
  Future<List<DownloadInfo>> getAllDownloads();
  Future<void> updateDownloadStatus(String slug, DownloadStatus status);
  Future<void> updateDownloadInfo(DownloadInfo info);
  Future<void> deleteDownloadInfo(String slug);
}