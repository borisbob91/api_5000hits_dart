part of 'mp3_music_repository.dart';

abstract class Mp3MusicRepositoryInterface {
  Future<List<Mp3Music>> fetchMusics();
  Future<List<Mp3Music>> fetchNextMusic();
  Future<Mp3Music> getMusicBySlug(String slug);
  bool canFetchNext();
}
