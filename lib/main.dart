import 'package:api_5000hits/api_5000hits.dart';
import 'package:api_5000hits_dart/albums/album_detail.dart';
import 'package:api_5000hits_dart/albums/album_gender.dart';
import 'package:api_5000hits_dart/albums/album_list.dart';
import 'package:api_5000hits_dart/music_detail.dart';
import 'package:api_5000hits_dart/albums/populare_albums.dart';
import 'package:api_5000hits_dart/albums/top_download_album.dart';
import 'package:api_5000hits_dart/musics/music_list_with_gender.dart';
import 'package:api_5000hits_dart/videos/video_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'albums/album_search.dart';
import 'auth_page.dart';
import 'download_page.dart';
import 'lyric_page.dart';
import 'musics/music_populars.dart';
import 'musics/music_search_page.dart';


void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '500Hits SDK test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: '5000Hits APi Test',),
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
  MusicSdk musicSdk = MusicSdk().init(key: "HbsLnz0a.2Gcl5tpx691BfDTDIqB6Ts5KAKBvmEvI");

  List<Mp3Album> albums = [];
  List<Mp3Music> musics = [];
  // var albums = [];
  
  void _fetchalubms() {
    setState(() {
      isLoading = true;
    });
    final re = musicSdk.artist?.getArtists();
    print('******** artist loaded ${re}');
    musicSdk.albumContrat?.getAlbums().then((onValue) {
      final data = onValue;
      print('*********************contrat loaded ${data}');
       setState(() {
        isLoading = false;
        albums = data;
      });
    });
  }

  void _fetchMusics() async{
    setState(() {
      isLoading = true;
    });
    final re = await musicSdk.auth?.signIn(email: "parkerboris@live.fr", password: "0759188395@Hits");
    print('auth state test: ${re}');
    musicSdk.musicContrat?.getMusics().then((value)  {
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
      body: SingleChildScrollView(child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return AlbumListPage();
              }));

            }, child: Text('Album List')),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return AlbumListByGenrePage();
              }));

            }, child: Text('Album genre')),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return PopulareAlbums();
              }));

            }, child: Text('Album Populars ')),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return TopDownloadAlbum();
              }));

            }, child: Text('Album top 100')),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return DownloadsPage();
              }));

            }, child: Text('download page')),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return AlbumSearchPage();
              }));

            }, child: Text('Album search')),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return MusicListByGenrePage();
              }));

            }, child: Text('Music list with genre')),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return PopularMusic();
              }));

            }, child: Text('Popular Music')),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return MusicSearchPage();
              }));

            }, child: Text('Search Music')),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return LyricsListPage();
              }));

            }, child: Text('Lyrics Music')),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return VideoListScreen();
              }));

            }, child: Text('videos Music')), ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return AuthTestPage();
              }));

            }, child: Text('auth Music')),
          ],
      ),),)
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