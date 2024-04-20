import 'package:api_5000hits/api_5000hits.dart';
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
  List<Map<String, dynamic>> albums = [];
  // var albums = [];
  
  void _incrementCounter() {
    setState(() {
      isLoading = true;
    });
    musicSdk.album?.fetchAlbumsList().then((value)  {
      albums = value.map((e) => e.toJson()).toList();
      print('loading ended');
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
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _incrementCounter();
      },
      child: const Icon(Icons.add) ,),
      body: Center(
        child: isLoading==true? const CircularProgressIndicator() : albums.isNotEmpty ? ListView.builder(
          physics: const BouncingScrollPhysics() ,
                itemCount: albums.length,
                itemBuilder:(BuildContext context, int index){
                   Map<String, dynamic> album = albums[index];
                  return ListTile(
                    title: Text(album['name']),
                    subtitle: Text(album['artist']),
                  );
            }) : const Center(child: Text("pas d'album pour le moment"),
        )
      ),
    );
  }
}
