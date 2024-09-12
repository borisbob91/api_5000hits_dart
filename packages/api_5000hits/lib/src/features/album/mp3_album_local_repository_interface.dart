
import 'mp3_album.dart';

abstract class Mp3AlbumLocalRepositoryInterface {
  static const int DEFAULT_PAGE_SIZE = 20;
  /// Récupère tous les albums stockés localement
  //Future<List<Mp3Album>> getAllAlbums();
  Future<List<Mp3Album>> getAllAlbums({int page = 0, int pageSize = DEFAULT_PAGE_SIZE});
  /// Récupère un album par son slug
  Future<Mp3Album?> getAlbumBySlug(String slug);

  /// Sauvegarde un album
  Future<void> saveAlbum(Mp3Album album);

  /// Sauvegarde une liste d'albums données
  Future<void> saveAlbums(List<Mp3Album> albums);

  /// Met à jour un album existant
  Future<void> updateAlbum(Mp3Album album);

  /// Supprime un album par son ID
  Future<void> deleteAlbum(int id);

  /// Supprime tous les albums
  Future<void> deleteAllAlbums();

  /// Recherche des albums par un terme de recherche
 // Future<List<Mp3Album>> searchAlbums(String searchTerm);
 // Recherche des albums par un terme de recherche avec pagination
  Future<List<Mp3Album>> searchAlbums(String searchTerm, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE});
  
  /// Vérifie si un album existe par son slug
  Future<bool> albumExists(String slug);
  
  /// Récupère les albums par genre
  //Future<List<Mp3Album>> getAlbumsByGenre(String genre);
  Future<List<Mp3Album>> getAlbumsByGenre(String genre, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE});
  
  /// Récupère les albums par artiste
  //Future<List<Mp3Album>> getAlbumsByArtist(String artist);
  Future<List<Mp3Album>> getAlbumsByArtist(String artist, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE});
  
  /// Récupère les albums les plus récents
  /// Récupère les albums les plus récents avec pagination
  Future<List<Mp3Album>> getRecentAlbums({int page = 0, int pageSize = DEFAULT_PAGE_SIZE});
  
  /// Récupère les albums les plus populaires (basé sur les hits)
  //Future<List<Mp3Album>> getPopularAlbums(int limit);
  Future<List<Mp3Album>> getPopularAlbums({int page = 0, int pageSize = DEFAULT_PAGE_SIZE});
  
  
 //Future<List<Mp3Album>> getAlbumsByCountry(int countryCode);
  Future<List<Mp3Album>> getAlbumsByCountry(int countryCode, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE});
  
  //Future<List<Mp3Album>> getSimilarAlbums(Mp3Album album, {int limit = 5});
  Future<List<Mp3Album>> getSimilarAlbums(Mp3Album album, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE});
  
 // Future<List<Mp3Album>> getAlbumsByDownloads({required int minDownloads,required int maxDays,});
  Future<List<Mp3Album>> getAlbumsByDownloads({
    required int minDownloads,
    required int maxDays,
    int page = 0,
    int pageSize = DEFAULT_PAGE_SIZE,
  });
 
}