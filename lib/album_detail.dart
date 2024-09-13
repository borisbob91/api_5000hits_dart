import 'package:flutter/material.dart';
import 'package:api_5000hits/api_5000hits.dart';

class AlbumDetailPage extends StatelessWidget {
  final Mp3Album album;
  final MusicSdk musicSdk = MusicSdk();

  AlbumDetailPage({Key? key, required this.album}) : super(key: key);

  Future<Map<String, dynamic>> _fetchAlbumDetails() async {
    Mp3Album? fetchedAlbum = await musicSdk.albumContrat?.getAlbumDetails(album.slug);
    final similarAlbums = await musicSdk.albumContrat?.getSimilarAlbums(album);
    return {
      'album': fetchedAlbum!,
      'similarAlbums': similarAlbums ?? [],
      'artistAlbums': await _fetchArtistAlbums(album),
    };
  }
   Future<List<Mp3Album>> _fetchArtistAlbums(Mp3Album mp3) async {
    final fetchedAlbums = await musicSdk.albumContrat?.getAlbumsByArtist(mp3.artist);
    return fetchedAlbums ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.name),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchAlbumDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Mp3Album detailedAlbum = snapshot.data!['album'];
            List<Mp3Album> similarAlbums = snapshot.data!['similarAlbums'];
            List<Mp3Album> artistAlbums = snapshot.data!['artistAlbums'];
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AlbumHeader(album: detailedAlbum),
                    const SizedBox(height: 20),
                    TrackList(tracks: detailedAlbum.tracks.toList()),
                    const SizedBox(height: 20),
                    Text('Artist Albums:', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 10),
                    SimilarAlbumsList(similarAlbums: artistAlbums),
                    const SizedBox(height: 20),
                    Text('Similar Albums:', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 10),
                    SimilarAlbumsList(similarAlbums: similarAlbums),
                    
                   
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

class AlbumHeader extends StatelessWidget {
  final Mp3Album album;

  const AlbumHeader({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.network(
            album.cover.value?.max ?? "https://img.freepik.com/free-vector/stylish-music-background_1394-1015.jpg?w=740&t=st=1713670017~exp=1713670617~hmac=e087aa741b1014054a9fd37fda387802ea7d23b17dea6ad0704a535df1709acf",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text('Artist: ${album.artist}', style: Theme.of(context).textTheme.titleSmall),
        Text('Track Number: ${album.tracksNb}', style: Theme.of(context).textTheme.titleSmall),
        Text("Year: ${album.year}", style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}

class TrackList extends StatelessWidget {
  final List<Mp3Music> tracks;

  const TrackList({Key? key, required this.tracks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tracks:', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tracks.length,
          itemBuilder: (context, index) {
            var track = tracks[index];
            return ListTile(
              leading: Text('${track.track ?? 'N/A'}'),
              title: Text(track.title ?? 'Unknown Title'),
              subtitle: Text('Duration: ${track.duration}'),
              trailing: Text('Track ${track.track ?? 'N/A'}'),
            );
          },
        ),
      ],
    );
  }

}

class SimilarAlbumsList extends StatelessWidget {
  final List<Mp3Album> similarAlbums;

  const SimilarAlbumsList({Key? key, required this.similarAlbums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: similarAlbums.length,
        itemBuilder: (context, index) {
          var similarAlbum = similarAlbums[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                Image.network(
                  similarAlbum.cover.value?.max ?? "https://img.freepik.com/free-vector/stylish-music-background_1394-1015.jpg?w=740&t=st=1713670017~exp=1713670617~hmac=e087aa741b1014054a9fd37fda387802ea7d23b17dea6ad0704a535df1709acf",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 5),
                Text(similarAlbum.name, style: Theme.of(context).textTheme.titleSmall),
                Text(similarAlbum.artist, style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          );
        },
      ),
    );
  }
}