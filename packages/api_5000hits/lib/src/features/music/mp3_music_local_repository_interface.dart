import 'package:isar/isar.dart';
import 'mp3_music.dart';

/// An interface for a local repository that manages 5000hits MP3 music data.
///
/// This interface provides methods for interacting with the local storage of MP3 music data, including
/// retrieving, saving, updating, and deleting music tracks.
abstract class Mp3MusicLocalRepositoryInterface {
  /// The default page size for pagination.
  static const int DEFAULT_PAGE_SIZE = 20;

  /// Retrieves a list of all music tracks.
  ///
  /// [page] the page number for pagination (default is 0)
  /// [pageSize] the number of items to return per page (default is [DEFAULT_PAGE_SIZE])
  /// returns a list of [Mp3Music] objects
  Future<List<Mp3Music>> getAllMusic({int page = 0, int pageSize = DEFAULT_PAGE_SIZE});

  /// Retrieves a music track by its slug.
  ///
  /// [slug] the slug of the music track to retrieve
  /// returns the [Mp3Music] object, or `null` if not found
  Future<Mp3Music?> getMusicBySlug(String slug);

  /// Saves a single music track or Updates an existing music track.
  ///
  /// [music] the [Mp3Music] object to save
  Future<void> saveOrUpdateMusic(Mp3Music music);

  /// Saves a list of music tracks.
  ///
  /// [musics] the list of [Mp3Music] objects to save
  Future<void> saveMusics(List<Mp3Music> musics);

  /// Deletes a music track by its ID.
  ///
  /// [id] the ID of the music track to delete
  Future<void> deleteMusic(Id id);

  /// Deletes all music tracks.
  Future<void> deleteAllMusic();

  /// Searches for music tracks by a search term.
  ///
  /// [searchTerm] the search term to use
  /// [page] the page number for pagination (default is 0)
  /// [pageSize] the number of items to return per page (default is [DEFAULT_PAGE_SIZE])
  /// returns a list of [Mp3Music] objects matching the search term
  Future<List<Mp3Music>> searchMusic(String searchTerm, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE});

  /// Checks if a music track with the given slug exists.
  ///
  /// [slug] the slug of the music track to check
  /// returns `true` if the music track exists, `false` otherwise
  Future<bool> musicExists(String slug);

  /// Retrieves the total count of music tracks.
  ///
  /// returns the total count of music tracks
  Future<int> countMusic();

  /// Retrieves a page of music tracks.
  ///
  /// [page] the page number for pagination (default is 0)
  /// [pageSize] the number of items to return per page (default is [DEFAULT_PAGE_SIZE])
  /// returns a list of [Mp3Music] objects for the specified page
  Future<List<Mp3Music>> getMusicByPage({int page = 0, int pageSize = DEFAULT_PAGE_SIZE});

  /// Retrieves a list of music tracks by genre.
  ///
  /// [genre] the genre of the music tracks to retrieve
  /// [page] the page number for pagination (default is 0)
  /// [pageSize] the number of items to return per page (default is [DEFAULT_PAGE_SIZE])
  /// returns a list of [Mp3Music] objects matching the specified genre
  Future<List<Mp3Music>> getMusicByGenre(String genre, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE});

  /// Retrieves a list of music tracks by artist.
  ///
  /// [artist] the artist of the music tracks to retrieve
  /// [page] the page number for pagination (default is 0)
  /// [pageSize] the number of items to return per page (default is [DEFAULT_PAGE_SIZE])
  /// returns a list of [Mp3Music] objects matching the specified artist
  Future<List<Mp3Music>> getMusicByArtist(String artist, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE});

  /// Retrieves a list of the most recently added music tracks.
  ///
  /// [page] the page number for pagination (default is 0)
  /// [pageSize] the number of items to return per page (default is [DEFAULT_PAGE_SIZE])
  /// returns a list of [Mp3Music] objects representing the most recently added music tracks
  Future<List<Mp3Music>> getRecentMusic({int page = 0, int pageSize = DEFAULT_PAGE_SIZE});

  /// Retrieves a list of the most popular music tracks.
  ///
  /// [page] the page number for pagination (default is 0)
  /// [pageSize] the number of items to return per page (default is [DEFAULT_PAGE_SIZE])
  /// returns a list of [Mp3Music] objects representing the most popular music tracks
  Future<List<Mp3Music>> getPopularMusic({int page = 0, int pageSize = DEFAULT_PAGE_SIZE});

  /// Retrieves a list of music tracks by country.
  ///
  /// [countryCode] the country code of the music tracks to retrieve
  /// [page] the page number for pagination (default is 0)
  /// [pageSize] the number of items to return per page (default is [DEFAULT_PAGE_SIZE])
  /// returns a list of [Mp3Music] objects matching the specified country
  Future<List<Mp3Music>> getMusicByCountry(int countryCode, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE});

  /// Retrieves a list of music tracks within a specified year range.
  ///
  /// [startYear] the start year of the year range
  /// [endYear] the end year of the year range
  /// [page] the page number for pagination (default is 0)
  /// [pageSize] the number of items to return per page (default is [DEFAULT_PAGE_SIZE])
  /// returns a list of [Mp3Music] objects within the specified year range
  Future<List<Mp3Music>> getMusicByYearRange(String startYear, String endYear, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE});

  /// Retrieves a list of music tracks similar to the provided music track.
  ///
  /// [music] the [Mp3Music] object to use as the basis for similarity
  /// [page] the page number for pagination (default is 0)
  /// [pageSize] the number of items to return per page (default is [DEFAULT_PAGE_SIZE])
  /// returns a list of [Mp3Music] objects similar to the provided music track
  Future<List<Mp3Music>> getSimilarMusic(Mp3Music music, {int page = 0, int pageSize = DEFAULT_PAGE_SIZE});

  /// Retrieves a list of music tracks with a minimum number of downloads within a specified time range.
  ///
  /// [minDownloads] the minimum number of downloads required for a music track to be included
  /// [maxDays] the maximum number of days since the last download (default is 60)
  /// [page] the page number for pagination (default is 0)
  /// [pageSize] the number of items to return per page (default is [DEFAULT_PAGE_SIZE])
  /// returns a list of [Mp3Music] objects meeting the specified download criteria
  Future<List<Mp3Music>> getMusicByDownloads({
    required int minDownloads,
    int maxDays = 60,
    int page = 0,
    int pageSize = DEFAULT_PAGE_SIZE,
  });
}


