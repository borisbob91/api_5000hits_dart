import 'package:api_5000hits/src/features/album/impl/mp3_album_service_implemente.dart';
import 'package:api_5000hits/src/utils/api_client.dart';
import 'src/core/databases/isar_manager.dart';
import 'src/features/album/impl/mp3_album_local_repository_implemente.dart';
import 'src/features/album/mp3_album_local_repository_interface.dart';
import 'src/features/album/impl/mp3_album_remote_repository_implemente.dart';
import 'src/features/album/mp3_album_remote_repository_interface.dart';


class AlbumContrat extends Mp3AlbumServiceImpl {
  static AlbumContrat? _instance;

  factory AlbumContrat() {
    if (_instance == null) {
      print('contrat init');
      final isarManager = IsarManager();
      final apiClient = ApiClient();

      final localDb = Mp3AlbumLocalRepositoryImplemente(isarManager: isarManager);
      final remoteDb = Mp3AlbumRemoteRepositoryImplemente(apiClient: apiClient);

      _instance = AlbumContrat._internal(remoteRepository: remoteDb, localRepository: localDb);
    }
    return _instance!;
  }

  AlbumContrat._internal(
  
  {  required Mp3RemoteRepositoryInterface remoteRepository,
     required Mp3AlbumLocalRepositoryInterface localRepository}
  ) : super(remoteRepository, localRepository) {
    
    // Initialisation supplémentaire si nécessaire
  }

  // Vous pouvez ajouter ici des méthodes spécifiques à Album

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