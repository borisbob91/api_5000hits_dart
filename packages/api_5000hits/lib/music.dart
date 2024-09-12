import 'package:api_5000hits/src/features/music/mp3_music.dart';
import 'package:api_5000hits/src/features/music/mp3_music_base_service.dart' show Mp3MusicService, Mp3MusicBaseService;
import 'package:api_5000hits/src/features/music/mp3_music_local_repository_implemente.dart';
import 'package:api_5000hits/src/features/music/mp3_music_local_repository_interface.dart';
import 'package:api_5000hits/src/features/music/mp3_music_remote_implemente.dart';
import 'package:api_5000hits/src/features/music/mp3_music_remote_interface.dart';
import 'package:api_5000hits/src/features/music/mp3_music_service_implemente.dart';

import 'src/core/databases/isar_manager.dart';
import 'src/utils/api_client.dart';

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

class MusicContrat extends Mp3MusicServiceImplemente {
  static MusicContrat? _instance;

  factory MusicContrat() {
    if (_instance == null) {
      print('music contrat init');
      final isarManager = IsarManager();
      final apiClient = ApiClient();

      final localDb = Mp3MusicLocalRepositoryImplemente(isarManager: isarManager);
      final remoteDb = Mp3MusicRemoteRepositoryImplement( apiClient);

      _instance = MusicContrat._internal(remoteRepository: remoteDb, localRepository: localDb);
    }
    return _instance!;
  }

  MusicContrat._internal(
  
  {  required Mp3MusicRemoteRepositoryInterface remoteRepository,
     required Mp3MusicLocalRepositoryInterface localRepository}
  ) : super(localRepository, remoteRepository) {
    
    // Initialisation supplémentaire si nécessaire
  }


  Future<void> downloadAlbum(String albumSlug) async {
    // Implémentation de la logique de téléchargement
    // Vous pouvez utiliser _localRepository et _remoteRepository ici
    
  }

  // Exemple de méthode qui combine des fonctionnalités
  Future<void> refreshAndGetPopularAlbums() async {
    await syncData(); // Méthode héritée de Mp3AlbumServiceImpl
    return; // Méthode héritée de Mp3AlbumServiceImpl
  }
}