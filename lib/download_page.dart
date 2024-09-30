// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// // Modèle pour représenter un téléchargement
// class DownloadItem {
//   final String id;
//   final String title;
//   final String artist;
//   final String coverUrl;
//   final double progress;
//   final int fileSize;
//   final bool isCompleted;
//
//   DownloadItem({
//     required this.id,
//     required this.title,
//     required this.artist,
//     required this.coverUrl,
//     required this.progress,
//     required this.fileSize,
//     required this.isCompleted,
//   });
// }
//
// // Énumération pour les options de filtrage
// enum DownloadFilter { all, inProgress, completed }
//
// // Provider pour la liste des téléchargements
// final downloadsProvider = StateNotifierProvider<DownloadsNotifier, List<DownloadItem>>((ref) => DownloadsNotifier());
//
// class DownloadsNotifier extends StateNotifier<List<DownloadItem>> {
//   DownloadsNotifier() : super([
//     // Exemple de données, à remplacer par vos vraies données
//     DownloadItem(id: '1', title: 'Song 1', artist: 'Artist 1', coverUrl: 'https://cdn-hits.5000hits.com/files/images/covers/2023/12/NQ1mxy5gvrdU.jpg', progress: 0.7, fileSize: 5 * 1024 * 1024, isCompleted: false),
//     DownloadItem(id: '2', title: 'Song 2', artist: 'Artist 2', coverUrl: 'https://cdn-hits.5000hits.com/files/images/covers/2023/12/6ygf4TOXcQjE.jpg', progress: 1.0, fileSize: 4 * 1024 * 1024, isCompleted: true),
//     // Ajoutez plus d'éléments ici
//   ]);
//
//   void updateProgress(String id, double progress) {
//     state = [
//       for (final item in state)
//         if (item.id == id)
//           DownloadItem(
//             id: item.id,
//             title: item.title,
//             artist: item.artist,
//             coverUrl: item.coverUrl,
//             progress: progress,
//             fileSize: item.fileSize,
//             isCompleted: progress == 1.0,
//           )
//         else
//           item,
//     ];
//   }
// }
//
// // Provider pour le filtre actuel
// final filterProvider = StateProvider<DownloadFilter>((ref) => DownloadFilter.all);
//
// class DownloadsPage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final downloads = ref.watch(downloadsProvider);
//     final filter = ref.watch(filterProvider);
//
//     final filteredDownloads = downloads.where((item) {
//       switch (filter) {
//         case DownloadFilter.inProgress:
//           return !item.isCompleted;
//         case DownloadFilter.completed:
//           return item.isCompleted;
//         case DownloadFilter.all:
//         default:
//           return true;
//       }
//     }).toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Downloads'),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(48.0),
//           child: DownloadFilterBar(),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: filteredDownloads.length,
//         itemBuilder: (context, index) {
//           return DownloadListItem(download: filteredDownloads[index]);
//         },
//       ),
//     );
//   }
// }
//
// class DownloadFilterBar extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final filter = ref.watch(filterProvider);
//
//     return Container(
//       color: Colors.grey[200],
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           FilterChip(
//             label: Text('All'),
//             selected: filter == DownloadFilter.all,
//             onSelected: (_) => ref.read(filterProvider.notifier).state = DownloadFilter.all,
//           ),
//           FilterChip(
//             label: Text('In Progress'),
//             selected: filter == DownloadFilter.inProgress,
//             onSelected: (_) => ref.read(filterProvider.notifier).state = DownloadFilter.inProgress,
//           ),
//           FilterChip(
//             label: Text('Completed'),
//             selected: filter == DownloadFilter.completed,
//             onSelected: (_) => ref.read(filterProvider.notifier).state = DownloadFilter.completed,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DownloadListItem extends StatelessWidget {
//   final DownloadItem download;
//
//   const DownloadListItem({Key? key, required this.download}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: ClipRRect(
//         borderRadius: BorderRadius.circular(4),
//         child: Image.network(download.coverUrl, width: 50, height: 50, fit: BoxFit.cover),
//       ),
//       title: Text(download.title),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(download.artist),
//           SizedBox(height: 4),
//           LinearProgressIndicator(
//             value: download.progress,
//             backgroundColor: Colors.grey[300],
//             valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//           ),
//           SizedBox(height: 4),
//           Text(
//             '${(download.progress * 100).toInt()}% - ${_formatFileSize(download.fileSize)}',
//             style: TextStyle(fontSize: 12),
//           ),
//         ],
//       ),
//       trailing: Icon(
//         download.isCompleted ? Icons.check_circle : Icons.download,
//         color: download.isCompleted ? Colors.green : Colors.blue,
//       ),
//     );
//   }
//
//   String _formatFileSize(int bytes) {
//     if (bytes < 1024) return '$bytes B';
//     if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
//     return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
//   }
// }





import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'albums/album_dl.dart';

class DownloadItem {
  final String id;
  final String title;
  final String artist;
  final String coverUrl;
  final double progress;
  final int fileSize;
  final bool isCompleted;
  final bool isPaused;
  final double downloadSpeed; // En KB/s

  DownloadItem({
    required this.id,
    required this.title,
    required this.artist,
    required this.coverUrl,
    required this.progress,
    required this.fileSize,
    required this.isCompleted,
    required this.isPaused,
    required this.downloadSpeed,
  });

  DownloadItem copyWith({
    double? progress,
    bool? isCompleted,
    bool? isPaused,
    double? downloadSpeed,
  }) {
    return DownloadItem(
      id: this.id,
      title: this.title,
      artist: this.artist,
      coverUrl: this.coverUrl,
      progress: progress ?? this.progress,
      fileSize: this.fileSize,
      isCompleted: isCompleted ?? this.isCompleted,
      isPaused: isPaused ?? this.isPaused,
      downloadSpeed: downloadSpeed ?? this.downloadSpeed,
    );
  }
}

enum DownloadFilter { all, inProgress, completed }

final downloadsProvider = StateNotifierProvider<DownloadsNotifier, List<DownloadItem>>((ref) => DownloadsNotifier());

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
}

final filterProvider = StateProvider<DownloadFilter>((ref) => DownloadFilter.all);

class DownloadsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloads = ref.watch(downloadsProvider);
    final filter = ref.watch(filterProvider);

    final filteredDownloads = downloads.where((item) {
      switch (filter) {
        case DownloadFilter.inProgress:
          return !item.isCompleted;
        case DownloadFilter.completed:
          return item.isCompleted;
        case DownloadFilter.all:
        default:
          return true;
      }
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Downloads'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: DownloadFilterBar(),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredDownloads.length,
        itemBuilder: (context, index) {
          return DownloadListItem(download: filteredDownloads[index]);
        },
      ),
    );
  }
}

class DownloadFilterBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterProvider);

    return Container(
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilterChip(
            label: Text('All'),
            selected: filter == DownloadFilter.all,
            onSelected: (_) => ref.read(filterProvider.notifier).state = DownloadFilter.all,
          ),
          FilterChip(
            label: Text('In Progress'),
            selected: filter == DownloadFilter.inProgress,
            onSelected: (_) => ref.read(filterProvider.notifier).state = DownloadFilter.inProgress,
          ),
          FilterChip(
            label: Text('Completed'),
            selected: filter == DownloadFilter.completed,
            onSelected: (_) => ref.read(filterProvider.notifier).state = DownloadFilter.completed,
          ),
        ],
      ),
    );
  }
}

class DownloadListItem2 extends ConsumerWidget {
  final DownloadItem download;

  const DownloadListItem2({Key? key, required this.download}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
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
          LinearProgressIndicator(
            value: download.progress,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(download.isPaused ? Colors.orange : Colors.blue),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(download.progress * 100).toInt()}% - ${_formatFileSize(download.fileSize)}',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                '${download.downloadSpeed.toStringAsFixed(1)} KB/s',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!download.isCompleted)
            IconButton(
              icon: Icon(download.isPaused ? Icons.play_arrow : Icons.pause),
              onPressed: () => ref.read(downloadsProvider.notifier).togglePause(download.id),
            ),
          IconButton(
            icon: Icon(download.isCompleted ? Icons.check_circle : Icons.cancel),
            color: download.isCompleted ? Colors.green : Colors.red,
            onPressed: () => ref.read(downloadsProvider.notifier).removeDownload(download.id),
          ),
        ],
      ),
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}