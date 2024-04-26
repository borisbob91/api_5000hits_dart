import 'package:api_5000hits/src/features/music/mp3_music.dart';
import 'package:api_5000hits/src/features/music/mp3_music_base_service.dart' show Mp3MusicService, Mp3MusicBaseService;

class Music implements Mp3MusicService{
  static final Mp3MusicBaseService _mp3musicBaseService= Mp3MusicBaseService();

  @override
  Future<List<Mp3Music>> fetchMusic() async {
    return await _mp3musicBaseService.fetchMusic();
  }

  @override
  Future<List<Mp3Music>> fetchMusicNext() async{
     return await _mp3musicBaseService.fetchMusicNext();
  }

  @override
  Future<Mp3Music> getMusicBySlug(String slug) async{
    return await _mp3musicBaseService.getMusicBySlug(slug);
  }

}