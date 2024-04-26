

import 'mp3_music.dart';
import 'mp3_music_repository.dart' hide Mp3MusicRepositoryInterface;

part 'mp3_music_service.dart';

class Mp3MusicBaseService implements Mp3MusicService{
  @override
  late final Mp3MusicRepository _mp3MusicRepository;
  static Mp3MusicBaseService instance = Mp3MusicBaseService._internal();

  factory Mp3MusicBaseService() => instance;

  Mp3MusicBaseService._internal(){
    _mp3MusicRepository =  Mp3MusicRepository();
  }
  
  @override
  Future<Mp3Music> getMusicBySlug(String slug) async {
    try {
      print("slug:=> $slug");
      Mp3Music mp3Music = await _mp3MusicRepository.getMusicBySlug(slug);
      print('object: $mp3Music');
      return mp3Music;
    } catch (error) {
      throw Exception('Failed to fetch Music by slug: $error');
    }
  }

  @override
  Future<List<Mp3Music>> fetchMusic() async  {
    try {
      return await _mp3MusicRepository.fetchMusics();
    } catch (error) {
      throw Exception('Failed to fetch service: $error');
    }
  }

  @override
  Future<List<Mp3Music>> fetchMusicNext() {
    return _mp3MusicRepository.fetchNextMusic();
  }


}
