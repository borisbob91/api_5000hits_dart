import 'package:api_5000hits/src/features/album/mp3_album.dart';
import 'package:api_5000hits/src/features/music/mp3_music.dart';
import 'package:api_5000hits/src/features/artist/mp3_artist.dart';

abstract interface class Mp3ArtistRemoteRepositoryInterface {
  final String route = '/api/v1/artists';

  // Récupère une liste paginée d'artistes
  Future<List<Mp3Artist>> fetchArtists({
    String? name,
    String? country,
    String? search,
    int? limit,
    int? page,
  });

  // Récupère les détails d'un artiste par son slug
  Future<Mp3Artist> getArtistBySlug({required String slug});

  // Récupère les albums d'un artiste
  Future<List<Mp3Album>> getArtistAlbums({required String slug, int? limit, int? page});

  // Récupère les pistes d'un artiste
  Future<List<Mp3Music>> getArtistTracks({required String slug, int? limit, int? page});

  // Récupère la page suivante d'artistes (si disponible)
  Future<List<Mp3Artist>> fetchNextArtists();

  // Vérifie s'il y a une page suivante d'artistes disponible
  bool canFetchNext();
}