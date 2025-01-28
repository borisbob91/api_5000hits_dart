import 'package:isar/isar.dart';
import 'package:equatable/equatable.dart';

enum DownloadStatus  {
  queued,
  downloading,
  paused,
  completed,
  error,
  cancelled
}

class DownloadInfo extends Equatable{
  final String id;
  final String fileName;
  final String url;
  final int totalBytes;
  final int downloadedBytes;
  final double progress;
  final DateTime startTime;
  final DownloadStatus status;
  final String? error;
  final  String? coverPath;
  final String slug;
  final String? taskId;

  DownloadInfo({
    required this.id,
    required this.fileName,
    required this.url,
    required this.slug,
    required this.startTime,
    this.totalBytes = 0,
    this.downloadedBytes = 0,
    this.progress = 0.0,
    this.status = DownloadStatus.queued,
    this.error,
    this.coverPath,
    this.taskId,
  });

  String get remainingTime {
    if (speed == 0) return 'Calcul en cours...';
    final remaining = (totalBytes - downloadedBytes) / speed;
    if (remaining < 60) return '\${remaining.round()} secondes';
    if (remaining < 3600) return '\${(remaining / 60).round()} minutes';
    return '\${(remaining / 3600).round()} heures';
  }

  double get speed {
    final elapsed = DateTime.now().difference(startTime).inSeconds;
    return elapsed > 0 ? downloadedBytes / elapsed : 0.0;
  }


  
  @override
  List<Object?> get props => [id, fileName, url, totalBytes, downloadedBytes, progress, startTime, status, error];
}
