import '../_downloader/download_info.dart';

abstract class DownloadStorageInterface {
  Future<void> saveDownloadInfo(DownloadInfo info);
  Future<DownloadInfo?> getDownloadInfo(String slug);
  Future<List<DownloadInfo>> getAllDownloads();
  Future<void> updateDownloadStatus(String slug, DownloadStatus status);
  Future<void> updateDownloadInfo(DownloadInfo info);
  Future<void> deleteDownloadInfo(String slug);
}