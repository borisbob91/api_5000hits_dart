part of 'mp3_music_service_implemente.dart';

abstract class Mp3MusicServiceInterface {
  /// Initializes the service by fetching the first batch of music from the server
  /// and storing it locally.
  Future<void> initialize();

  /// Retrieves the next page of music tracks.
  /// Returns 20 tracks at a time from the local cache.
  /// If the local cache is depleted, it automatically fetches the next batch from the server.
  Future<List<Mp3Music>> getNextPage();

  /// Resets the pagination to the beginning.
  void resetPagination();

  /// Checks if there are more music tracks available locally or on the server.
  Future<bool> hasMore();

  /// Searches for music tracks based on a query.
  /// This should search both locally and on the server if necessary.
  Future<List<Mp3Music>> searchMusic(String query, {int limit = 20, int offset = 0});

  /// Retrieves a specific music track by its slug.
  /// Checks local cache first, then fetches from server if not found.
  Future<Mp3Music?> getMusicBySlug(String slug);

  /// Retrieves a list of popular music tracks.
  Future<List<Mp3Music>> getPopularMusic({int limit = 20, int offset = 0});

  /// Retrieves a list of recently added music tracks.
  Future<List<Mp3Music>> getRecentMusic({int limit = 20, int offset = 0});

  /// Retrieves a list of music tracks by a specific artist.
  Future<List<Mp3Music>> getMusicByArtist(String artist, {int limit = 20, int offset = 0});

  /// Retrieves a list of music tracks from a specific album.
  Future<List<Mp3Music>> getMusicByAlbum(String album, {int limit = 20, int offset = 0});

  /// Retrieves a list of music tracks of a specific genre.
  Future<List<Mp3Music>> getMusicByGenre(String genre, {int limit = 20, int offset = 0});

  /// Retrieves a list of music tracks similar to a given track.
  Future<List<Mp3Music>> getSimilarMusic(String musicSlug, {int limit = 20});

  /// Synchronizes local data with the server.
  /// This could be used to update local cache with any changes from the server.
  Future<void> syncData();

  /// Clears the local cache of music tracks.
  Future<void> clearCache();

  /// Checks if the local cache needs updating.
  Future<bool> needsUpdate();

  /// Preloads the cache with a fresh batch of data from the server.
  Future<void> preloadCache();

  /// Retrieves detailed information about a specific music track.
  /// This might include additional data not stored in the basic Mp3Music object.
  Future<Map<String, dynamic>> getMusicDetails(String slug);
}