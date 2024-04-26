part of 'mp3_music_base_service.dart';

abstract class Mp3MusicService {
  late final Mp3MusicRepository _mp3MusicRepository;
  Future<List<Mp3Music>> fetchMusic();
  Future<List<Mp3Music>> fetchMusicNext();
  Future<Mp3Music> getMusicBySlug(String slug);

}