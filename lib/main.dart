import 'package:api_5000hits/api_5000hits.dart';
import 'package:api_5000hits_dart/album_detail.dart';
import 'package:api_5000hits_dart/album_list.dart';
import 'package:api_5000hits_dart/music_detail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading= false;
  MusicSdk musicSdk = MusicSdk().init(key: "key");
  List<Mp3Album> albums = [];
  List<Mp3Music> musics = [];
  // var albums = [];
  
  void _fetchalubms() {
    setState(() {
      isLoading = true;
    });
    musicSdk.albumContrat?.getAlbums().then((onValue) {
      final data = onValue;
      print('contrat loaded ${data}');
    });
    musicSdk.album?.fetchAlbumsList().then((value)  {
      albums = value;
      print('loading ended');
      setState(() {
        isLoading = false;
      });
    });
  }

  void _fetchMusics() {
    setState(() {
      isLoading = true;
    });
    musicSdk.music?.fetchMusic().then((value)  {
      musics = value;
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder){
              return AlbumListPage();
            }));
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // _fetchalubms();
        _fetchMusics();
      },
      child: const Icon(Icons.add) ,),
      body: MusicWidget(isLoading: isLoading, musics: musics),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.isLoading,
    required this.albums,
  });

  final bool isLoading;
  final List<Mp3Album> albums;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading==true? const CircularProgressIndicator() : albums.isNotEmpty ? ListView.builder(
        physics: const BouncingScrollPhysics() ,
              itemCount: albums.length,
              itemBuilder:(BuildContext context, int index){
                 Mp3Album album = albums[index];
                return ListTile(
                  title: Text('${album.name}'),
                  subtitle: Text('${album.artist}'),
                  trailing: Icon(Icons.audio_file),
                  selected: false,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlbumDetailPage(album: album),
                      ),
                    );
                  },
                  onLongPress: (){

                  },
                );
          }) : const Center(child: Text("pas d'album pour le moment"),
      )
    );
  }
}

class MusicWidget extends StatelessWidget {
  const MusicWidget({
    super.key,
    required this.isLoading,
    required this.musics,
  });

  final bool isLoading;
  final List<Mp3Music> musics;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: isLoading==true? const CircularProgressIndicator() : musics.isNotEmpty ? ListView.builder(
            physics: const BouncingScrollPhysics() ,
            itemCount: musics.length,
            itemBuilder:(BuildContext context, int index){
              Mp3Music mp3music = musics[index];
              return ListTile(
                title: Text('${mp3music.title}'),
                subtitle: Text('${mp3music.artist}'),
                trailing: const Icon(Icons.audio_file),
                selected: false,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MusicDetailsPage(mp3music: mp3music,),
                    ),
                  );
                },
                onLongPress: (){

                },
              );
            }) : const Center(child: Text("Padd de Music pour le moment."),
        )
    );
  }
}