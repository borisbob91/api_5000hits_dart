import 'package:isar/isar.dart';

part 'download_info.g.dart';


enum DownloadStatus { notStarted, downloading, paused, completed, failed, cancelled }

class DownloadInfo {
  final String slug;
  final String filePath;
  DownloadStatus status;
  double progress;
  int totalBytes;
  int downloadedBytes;
  String? coverPath;

  DownloadInfo(this.slug, this.filePath, this.coverPath)
      : status = DownloadStatus.notStarted,
        progress = 0.0,
        totalBytes = 0,
        downloadedBytes = 0;
  // copyWith methode
  DownloadInfo copyWith({
    DownloadStatus? status,
    double? progress,
    int? totalBytes,
    int? downloadedBytes,
    String? coverPath,
  }) {
    return DownloadInfo(
      slug,
      filePath,
      coverPath ?? this.coverPath,
    )
      ..status = status ?? this.status
      ..progress = progress ?? this.progress
      ..totalBytes = totalBytes ?? this.totalBytes
      ..downloadedBytes = downloadedBytes ?? this.downloadedBytes;
  }
}


@collection
class DownloadInfoIsar  {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String slug;

  late String filePath;

  @enumerated
  late DownloadStatus status;
  late double progress;
  late int totalBytes;
  late int downloadedBytes;
  late String? coverPath;

  DownloadInfoIsar();

  DownloadInfoIsar.fromDownloadInfo(DownloadInfo info) {
    slug = info.slug;
    filePath = info.filePath;
    status = info.status;
    progress = info.progress;
    totalBytes = info.totalBytes;
    downloadedBytes = info.downloadedBytes;
    coverPath = info.coverPath;
  }

  DownloadInfo toDownloadInfo() {
    return DownloadInfo(slug, filePath, coverPath)
      ..status = status
      ..progress = progress
      ..totalBytes = totalBytes
      ..downloadedBytes = downloadedBytes;
  }
}