import 'package:api_5000hits/src/features/album/mp3_album.dart';
import 'package:api_5000hits/src/features/music/mp3_music.dart';
import 'package:api_5000hits/src/features/artist/mp3_artist.dart';

abstract interface class Mp3ArtistServiceInterface {
  /// Récupère une liste paginée d'artistes.
  Future<List<Mp3Artist>> getArtists({int page = 0, int pageSize = 20,String? name,
    String? country, String? search});

  /// Récupère les détails d'un artiste par son slug.
  Future<Mp3Artist> getArtistDetails(String slug);

  /// Récupère les albums d'un artiste.
  Future<List<Mp3Album>> getArtistAlbums({required String slug,int page = 0, int pageSize = 20});

  /// Récupère les pistes d'un artiste.
  Future<List<Mp3Music>> getArtistTracks(String slug, {int page = 0, int pageSize = 20});

  /// Récupère les artistes populaires.
  Future<List<Mp3Artist>> getPopularArtists({int page = 0, int pageSize = 20});

  /// Recherche des artistes basés sur un terme de recherche.
  Future<List<Mp3Artist>> searchArtists(String searchTerm, {int page = 0, int pageSize = 20});

  /// Synchronise les données locales avec les données distantes.
  Future<void> syncData();

  /// Vérifie si une mise à jour des données est nécessaire.
  Future<bool> needsUpdate();

  /// Efface le cache des artistes local.
  Future<void> clearCache();

  /// Précharge certaines données dans le cache local.
  Future<void> preloadCache();
}