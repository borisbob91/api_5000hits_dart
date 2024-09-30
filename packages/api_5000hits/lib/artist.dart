import 'package:api_5000hits/src/features/artist/mp3_artist_remote_repository_impl.dart';
import 'package:api_5000hits/src/features/artist/mp3_artist_service_impl.dart';
import 'package:api_5000hits/src/utils/api_client.dart';

class ArtistContrat extends Mp3ArtistServiceImpl {
  static ArtistContrat? _instance;

  factory ArtistContrat() {
    if (_instance == null) {
      print('ArtistContrat initialization');
      final apiClient = ApiClient();
      final remoteRepo = Mp3ArtistRemoteRepositoryImplement(apiClient);
      _instance = ArtistContrat._internal(remoteRepository: remoteRepo);
    }
    return _instance!;
  }

  ArtistContrat._internal({required Mp3ArtistRemoteRepositoryImplement remoteRepository})
      : super(remoteRepository);


  // Exemple de méthode qui pourrait être spécifique à votre SDK
  Future<void> followArtist(String artistSlug) async {
    // Implémentez ici la logique pour suivre un artiste
    // Cela pourrait impliquer un appel API spécifique non couvert par le service général
    throw UnimplementedError('followArtist not implemented yet');
  }

  // Autre exemple de méthode spécifique
  Future<void> unfollowArtist(String artistSlug) async {
    // Implémentez ici la logique pour ne plus suivre un artiste
    throw UnimplementedError('unfollowArtist not implemented yet');
  }
}