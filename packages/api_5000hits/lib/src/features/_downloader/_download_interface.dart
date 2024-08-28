// Interfaces

import 'mp3-downloader-with-interfaces.dart';

abstract class DownloaderInterface {
  Future<void> downloadFile(String url, String savePath, Function(int, int) onProgress);
  String getDownloadUrl(String slug);
}

abstract class DownloadManagerInterface {
  Future<void> downloadMusic(String slug, String savePath, Function(DownloadInfo) onProgressUpdate);
  Future<void> cancelDownload(String slug);
  DownloadInfo? getDownloadInfo(String slug);
  List<DownloadInfo> getAllDownloads();
}

abstract class SignatureGeneratorInterface {
  String generateSignature(String slug, int timestamp);
}



abstract class ResumableDownloaderInterface extends DownloaderInterface {
  Future<void> resumeDownload(String url, String savePath, int startByte, Function(int, int) onProgress);
}

abstract class ConcurrentDownloadManagerInterface extends DownloadManagerInterface {
  Future<void> setMaxConcurrentDownloads(int max);
  int get currentConcurrentDownloads;
}

abstract class PausableDownloadInterface {
  Future<void> pauseDownload(String slug);
  Future<void> resumeDownload(String slug);
}
