import 'mp3_music.dart';


/// Defines the interface for a remote repository that manages MP3 music data.
///
/// This interface provides methods to fetch, search, and retrieve various types of
/// MP3 music data, such as by artist, album, genre, and popularity. It also
/// includes methods to fetch the next page of music results and retrieve
/// statistics about the music data.
abstract class Mp3MusicRemoteRepositoryInterface {
  /// Fetches a list of [Mp3Music] objects based on the provided search criteria.
  ///
  /// The search criteria can include artist, slug, title, album, year, genre,
  /// country, search query, limit, offset, sort order, and date range.
  Future<List<Mp3Music>> fetchMusic({
    String? artist,
    String? slug,
    String? title,
    String? album,
    String? year,
    String? genre,
    int? country,
    String? search,
    int? limit,
    int? offset,
    String? sortBy,
    bool? sortDesc,
    int? minHits,
    int? maxHits,
    DateTime? startDate,
    DateTime? endDate,
  });

  /// Retrieves an [Mp3Music] object by its slug.
  Future<Mp3Music> getMusicBySlug(String slug);

  /// Fetches the next page of music results.
  Future<List<Mp3Music>> fetchNextMusic();

  /// Searches for music based on the provided query.
  ///
  /// The search is limited to the specified limit and offset.
  Future<List<Mp3Music>> searchMusic(String query, {int limit = 20, int offset = 0});

  /// Retrieves a list of the most popular music.
  ///
  /// The results are limited to the specified limit and offset.
  Future<List<Mp3Music>> getPopularMusic({ int limit = 20, int page = 1});

  /// Retrieves a list of the most recently added music.
  ///
  /// The results are limited to the specified limit and offset.
  Future<List<Mp3Music>> getRecentMusic({int limit = 20, int offset = 0});

  /// Retrieves a list of music by the specified artist.
  ///
  /// The results are limited to the specified limit and offset.
  Future<List<Mp3Music>> getMusicByArtist(String artist, {int limit = 20, int offset = 0});

  /// Retrieves a list of music by the specified artist.
  ///
  /// The results are limited to the specified limit and offset.
  Future<List<Mp3Music>> getMusicForArtistBySlug( { required String musicSlug,int limit = 20, int page = 1});

  /// Retrieves a list of music from the specified album.
  ///
  /// The results are limited to the specified limit and offset.
  Future<List<Mp3Music>> getMusicByAlbum(String album, {int limit = 20, int offset = 0});

  /// Retrieves a list of music in the specified genre.
  ///
  /// The results are limited to the specified limit and offset.
  Future<List<Mp3Music>> getMusicByGenre(String genre, {int limit = 20, int offset = 0});

  /// Retrieves a list of music that is similar to the specified music.
  ///
  /// The results are limited to the specified limit.
  Future<List<Mp3Music>> getSimilarMusic(String musicSlug, {int limit = 20, int page=1});

  /// Determines whether there are more music results that can be fetched.
  bool canFetchNext();
}