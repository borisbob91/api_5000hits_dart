import 'package:api_5000hits/api_5000hits.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final musicSkdProvider = Provider((ref){
  MusicSdk musicSdk = MusicSdk().init(key: "xDD849t9.1liZ1a9I7Oud4kxQEAanh5cQAQe9kLEB");
   return musicSdk;
});

final skdAlbumProvider = Provider((ref){
  final musicSdk = ref.watch(musicSkdProvider);
  return musicSdk.albumContrat!;
});

final skdMusicProvider = Provider((ref){
  final musicSdk = ref.watch(musicSkdProvider);
  return musicSdk.musicContrat;
});

final sdkAuthProvider = Provider((ref){
  final musicSdk = ref.watch(musicSkdProvider);
  return musicSdk.auth;
});