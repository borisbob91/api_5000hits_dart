import 'package:flutter/material.dart';
import 'package:api_5000hits/api_5000hits.dart';

class MusicDetailPage extends StatelessWidget {
  final Mp3Music music;
  final MusicSdk musicSdk = MusicSdk.instance;

  MusicDetailPage({Key? key, required this.music}) : super(key: key);

  Future<Map<String, dynamic>> _fetchMusicDetails() async {
    Mp3Music? fetchedMusic = await musicSdk.musicContrat?.getMusicDetails(slug: music.slug);
    // final similarMusic = await musicSdk.musicContrat?.getSimilarMusic(musicSlug: music.slug);
    List<Mp3Music> similarMusic = [];
    return {
      'music': fetchedMusic!,
      'similarMusic': similarMusic ?? [],
      'artistMusic': await _fetchArtistMusic(music),
    };
  }

  Future<List<Mp3Music>> _fetchArtistMusic(Mp3Music mp3) async {
    final fetchedMusic = await musicSdk.musicContrat?.getMusicByArtist(mp3.artist);
    final fetchedMusic2 = await musicSdk.musicContrat?.getMusicOfArtist(musicSlug: mp3.slug);
    return fetchedMusic2 ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(music.title ?? 'Unknown Title'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchMusicDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Mp3Music detailedMusic = snapshot.data!['music'];
            List<Mp3Music> similarMusic = snapshot.data!['similarMusic'];
            List<Mp3Music> artistMusic = snapshot.data!['artistMusic'];
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MusicHeader(music: detailedMusic),
                    const SizedBox(height: 20),
                    MusicDetails(music: detailedMusic),
                    const SizedBox(height: 20),
                    Text('Artist Music:', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 10),
                    SimilarMusicList(similarMusic: artistMusic),
                    const SizedBox(height: 20),
                    Text('Similar Music:', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 10),
                    SimilarMusicList(similarMusic: similarMusic),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('Aucune donnée disponible'));
          }
        },
      ),
    );
  }
}

class MusicHeader extends StatelessWidget {
  final Mp3Music music;

  const MusicHeader({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.network(
            music.cover.value?.min ?? "https://img.freepik.com/free-vector/musical-pentagram-sound-waves-notes-background_1017-33911.jpg",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text('Title: ${music.title}', style: Theme.of(context).textTheme.titleLarge),
        Text('Artist: ${music.artist}', style: Theme.of(context).textTheme.titleMedium),
        Text('Album: ${music.album}', style: Theme.of(context).textTheme.titleSmall),
        Text("Year: ${music.year}", style: Theme.of(context).textTheme.titleSmall),
        Text("Genre: ${music.genre}", style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}

class MusicDetails extends StatelessWidget {
  final Mp3Music music;

  const MusicDetails({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Music Details:', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        ListTile(
          title: Text('Duration: ${music.duration ?? 'Unknown'}'),
          subtitle: Text('Bitrate: ${music.bitrate ?? 'Unknown'}'),
        ),
        ListTile(
          title: Text('Track Number: ${music.track ?? 'Unknown'}'),
          subtitle: Text('File Size: ${music.filesize ?? 'Unknown'}'),
        ),
        ExpansionTile(
          title: Text('Lyrics'),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(music.lyrics?.title ?? 'No lyrics available'),
            ),
          ],
        ),
      ],
    );
  }
}

class SimilarMusicList extends StatelessWidget {
  final List<Mp3Music> similarMusic;

  const SimilarMusicList({Key? key, required this.similarMusic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: similarMusic.length,
        itemBuilder: (context, index) {
          var song = similarMusic[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              child: Column(
                children: [
                  Image.network(
                    song.cover.value!.min ?? "https://img.freepik.com/free-vector/musical-pentagram-sound-waves-notes-background_1017-33911.jpg",
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 5),
                  Text(song.title ?? 'Unknown Title', style: Theme.of(context).textTheme.titleSmall),
                  Text(song.artist ?? 'Unknown Artist', style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MusicDetailPage(music: song,)));
              },
            ),
          );
        },
      ),
    );
  }
}