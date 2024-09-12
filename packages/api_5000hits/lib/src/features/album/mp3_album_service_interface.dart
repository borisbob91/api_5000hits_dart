import 'package:api_5000hits/src/features/album/mp3_album.dart';

abstract class Mp3AlbumServiceInterface {
  /// Récupère une liste paginée d'albums.
  /// Tente d'abord de récupérer depuis le cache local, puis met à jour avec les données distantes si nécessaire.
  Future<List<Mp3Album>> getAlbums({int page = 0, int pageSize = 20});

  /// Recherche des albums basés sur un terme de recherche.
  /// Effectue d'abord une recherche locale, puis une recherche distante si nécessaire.
  Future<List<Mp3Album>> searchAlbums(String searchTerm, {int page = 0, int pageSize = 20});
  Future<Mp3Album> getAlbumDetails(String slug);


  /// Récupère les albums populaires.
  /// Utilise d'abord les données locales, puis met à jour avec les données distantes périodiquement.
  Future<List<Mp3Album>> getPopularAlbums({int page = 0, int pageSize = 20});

  /// Récupère les albums récents.
  /// Fait une requête distante et met à jour le cache local.
  Future<List<Mp3Album>> getRecentAlbums({int page = 0, int pageSize = 20});

  /// Récupère les albums par genre.
  /// Utilise d'abord les données locales, puis met à jour avec les données distantes si nécessaire.
  Future<List<Mp3Album>> getAlbumsByGenre(String genre, {int page = 0, int pageSize = 20});

  /// Récupère les albums par artiste.
  /// Utilise d'abord les données locales, puis met à jour avec les données distantes si nécessaire.
  Future<List<Mp3Album>> getAlbumsByArtist(String artist, {int page = 0, int pageSize = 20});

  /// Récupère les albums similaires à un album donné.
  /// Combine les résultats locaux et distants pour une meilleure pertinence.
  Future<List<Mp3Album>> getSimilarAlbums(Mp3Album album, {int page = 0, int pageSize = 20});

  /// Synchronise les données locales avec les données distantes.
  /// Cette méthode peut être appelée périodiquement ou sur demande de l'utilisateur.
  Future<void> syncData();

  /// Vérifie si une mise à jour des données est nécessaire.
  /// Peut être basé sur un timestamp ou d'autres critères.
  Future<bool> needsUpdate();

  /// Efface le cache local.
  Future<void> clearCache();

  /// Précharge certaines données dans le cache local.
  /// Peut être utilisé au démarrage de l'application pour améliorer les performances initiales.
  Future<void> preloadCache();
}