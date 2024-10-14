import 'package:api_5000hits_dart/musics/music_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:api_5000hits/api_5000hits.dart';

class MusicList extends StatelessWidget {
  final List<Mp3Music> music;
  final ScrollController scrollController;
  final bool isLoading;
  final bool hasMore;

  const MusicList({
    Key? key,
    required this.music,
    required this.scrollController,
    required this.isLoading,
    required this.hasMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: music.length + (isLoading || hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < music.length) {
          final song = music[index];
          return ListTile(
            leading: song.cover.value != null
                ? Image.network(song.cover.value!.min ?? '', width: 50, height: 50, fit: BoxFit.cover)
                : const Icon(Icons.music_note, size: 50),
            title: Text(song.title ?? 'Unknown Title'),
            subtitle: Text(song.artist ?? 'Unknown Artist'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicDetailPage(music: song,)));
            },
          );
        } else if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}