import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../download_page.dart';


class DownloadsNotifier extends StateNotifier<List<DownloadItem>> {
  DownloadsNotifier() : super([
    DownloadItem(id: '1', title: 'Song 1', artist: 'Artist 1', coverUrl: 'https://cdn-hits.5000hits.com/files/images/covers/2023/12/NQ1mxy5gvrdU.jpg', progress: 0.7, fileSize: 5 * 1024 * 1024, isCompleted: false, isPaused: false, downloadSpeed: 256.0),
    DownloadItem(id: '2', title: 'Song 2', artist: 'Artist 2', coverUrl: 'https://cdn-hits.5000hits.com/files/images/covers/2023/12/6ygf4TOXcQjE.jpg', progress: 1.0, fileSize: 4 * 1024 * 1024, isCompleted: true, isPaused: false, downloadSpeed: 0.0),
  ]);

  void updateProgress(String id, double progress, double downloadSpeed) {
    state = [
      for (final item in state)
        if (item.id == id)
          item.copyWith(
            progress: progress,
            isCompleted: progress == 1.0,
            downloadSpeed: downloadSpeed,
          )
        else
          item,
    ];

    if (progress == 1.0) {
      _showCompletionToast(state.firstWhere((item) => item.id == id).title);
    }
  }

  void togglePause(String id) {
    state = [
      for (final item in state)
        if (item.id == id)
          item.copyWith(isPaused: !item.isPaused, downloadSpeed: item.isPaused ? 256.0 : 0.0)
        else
          item,
    ];
  }

  void removeDownload(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  void _showCompletionToast(String title) {
    Fluttertoast.showToast(
        msg: "$title has finished downloading",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}

// ... [Le reste du code jusqu'à la classe DownloadListItem reste inchangé]

class DownloadListItem extends ConsumerWidget {
  final DownloadItem download;

  const DownloadListItem({Key? key, required this.download}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      color: download.isPaused ? Colors.grey[100] : Colors.transparent,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(download.coverUrl, width: 50, height: 50, fit: BoxFit.cover),
        ),
        title: Text(download.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(download.artist),
            SizedBox(height: 4),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 4,
              child: LinearProgressIndicator(
                value: download.progress,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                    download.isPaused ? Colors.orange : Colors.blue
                ),
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${(download.progress * 100).toInt()}% - ${_formatFileSize(download.fileSize)}',
                  style: TextStyle(fontSize: 12),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Text(
                    download.isPaused ? 'Paused' : '${download.downloadSpeed.toStringAsFixed(1)} KB/s',
                    key: ValueKey<bool>(download.isPaused),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!download.isCompleted)
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: IconButton(
                  key: ValueKey<bool>(download.isPaused),
                  icon: Icon(download.isPaused ? Icons.play_arrow : Icons.pause),
                  onPressed: () => ref.read(downloadsProvider.notifier).togglePause(download.id),
                ),
              ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: IconButton(
                key: ValueKey<bool>(download.isCompleted),
                icon: Icon(download.isCompleted ? Icons.check_circle : Icons.cancel),
                color: download.isCompleted ? Colors.green : Colors.red,
                onPressed: () => ref.read(downloadsProvider.notifier).removeDownload(download.id),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}