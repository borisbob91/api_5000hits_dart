import 'package:api_5000hits/api_5000hits.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';


class MusicDetailsPage extends StatefulWidget {
  final Mp3Music mp3music;
  const MusicDetailsPage({super.key, required this.mp3music});

  @override
  _MusicDetailsPageState createState() => _MusicDetailsPageState();
}

class _MusicDetailsPageState extends State<MusicDetailsPage> {
  // final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    // _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la musique'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Affiche l'image de couverture de l'album
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMK-hAeGiFboZm2QLNB3aXGUQT8knA5J6c9_66qjS0eg&s"),
            // Affiche le titre de la chanson
             Text(
              '${widget.mp3music.title}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            // Affiche l'artiste
             Text(
              'Artiste: ${widget.mp3music.artist}',
              style: const TextStyle(fontSize: 18),
            ),

            // Affiche l'album
            Text(
              'Album: ${widget.mp3music.album}',
              style: const TextStyle(fontSize: 16),
            ),

            // Affiche le genre
             Text(
              'Genre: ${widget.mp3music.genre}',
              style: TextStyle(fontSize: 16),
            ),

            // Affiche la durée de la chanson
             Text(
              'Durée: ${widget.mp3music.duration}',
              style: const TextStyle(fontSize: 14),
            ),

            // Affiche les boutons de lecture et de pause
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () async {
                   // await _audioPlayer.play('assets/audio.mp3');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: () async {
                    // await _audioPlayer.pause();
                  },
                ),
              ],
            ),

            // Affiche le curseur de progression
            Slider(
              value: 0.0,
              onChanged: (double value) {
               // _audioPlayer.seek(Duration(seconds: value.toInt()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
