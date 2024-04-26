import 'package:api_5000hits/music.dart';
import 'package:flutter/material.dart';
import 'package:api_5000hits/api_5000hits.dart';


class AlbumDetailPage extends StatefulWidget {
  final Mp3Album album;
  var _mp3album;
   AlbumDetailPage({Key? key, required this.album}) : super(key: key);

  @override
  State<AlbumDetailPage> createState() => _AlbumDetailPageState();

}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  @override
  void initState() {
    super.initState();
    _fetchAlbumDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.album.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Artist: ${widget.album.artist}'),
            Text('Artist: ${widget.album.tracksNb}'),
            Text('Artist: ${widget._mp3album?.trackList}'),
            if (widget.album != null) Image.network(
              "https://img.freepik.com/free-vector/stylish-music-background_1394-1015.jpg?w=740&t=st=1713670017~exp=1713670617~hmac=e087aa741b1014054a9fd37fda387802ea7d23b17dea6ad0704a535df1709acf" ?? '',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ) else Container(),
            // Ajoutez d'autres détails de l'album ici
          ],
        ),
      ),
    );
  }


  Future<void> _fetchAlbumDetails() async {
    MusicSdk musicSdk = MusicSdk();
    Mp3Album? album = await musicSdk.album?.fetchAlbumBySlug('${widget.album.slug}');
    if (album != null) {
      setState(() {
        widget._mp3album = album;
      });
    }
  }
}