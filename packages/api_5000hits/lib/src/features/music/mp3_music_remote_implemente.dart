import 'package:api_5000hits/src/utils/api_client.dart';
import 'mp3_music.dart';
import 'mp3_music_remote_interface.dart';


class Mp3MusicRemoteRepositoryImplement implements Mp3MusicRemoteRepositoryInterface {
  late final ApiClient _apiClient;
  final  String _route = '/musics';
  String? _nextPageUrl;

  Mp3MusicRemoteRepositoryImplement(this._apiClient);

  @override
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
  }) async {
    try {
      final response = await _apiClient.get(_route, queryParameters: {
        if (artist != null) 'artist': artist,
        if (slug != null) 'slug': slug,
        if (title != null) 'title': title,
        if (album != null) 'album': album,
        if (year != null) 'year': year,
        if (genre != null) 'genre': genre,
        if (country != null) 'country': country,
        if (search != null) 'search': search,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
        if (sortBy != null) 'sort_by': sortBy,
        if (sortDesc != null) 'sort_desc': sortDesc,
        if (minHits != null) 'min_hits': minHits,
        if (maxHits != null) 'max_hits': maxHits,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
      });

      final List<dynamic> data = response.data['results'];
      _nextPageUrl = response.data['next'];
      return data.map((json) => Mp3Music.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch music: $e');
    }
  }

  @override
  Future<Mp3Music> getMusicBySlug(String slug) async {
    try {
      final response = await _apiClient.get('$_route/$slug');
      return Mp3Music.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get music by slug: $e');
    }
  }

  @override
  Future<List<Mp3Music>> fetchNextMusic() async {
    if (_nextPageUrl == null) {
      throw Exception('No more music to fetch');
    }
    try {
      final response = await _apiClient.get(_nextPageUrl!);
      final List<dynamic> data = response.data['results'];
      _nextPageUrl = response.data['next'];
      return data.map((json) => Mp3Music.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch next music: $e');
    }
  }

  @override
  Future<List<Mp3Music>> searchMusic(String query, {int limit = 20, int offset = 0}) async {
    return fetchMusic(search: query, limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getPopularMusic({int limit = 20, int offset = 0}) async {
    return fetchMusic(sortBy: 'hits', sortDesc: true, limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getRecentMusic({int limit = 20, int offset = 0}) async {
    return fetchMusic(sortBy: 'uploaded', sortDesc: true, limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getMusicByArtist(String artist, {int limit = 20, int offset = 0}) async {
    return fetchMusic(artist: artist, limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getMusicByAlbum(String album, {int limit = 20, int offset = 0}) async {
    return fetchMusic(album: album, limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getMusicByGenre(String genre, {int limit = 20, int offset = 0}) async {
    return fetchMusic(genre: genre, limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getSimilarMusic(String musicSlug, {int limit = 20}) async {
    try {
      final response = await _apiClient.get('$_route/$musicSlug/similar', queryParameters: {'limit': limit});
      final List<dynamic> data = response.data['results'];
      return data.map((json) => Mp3Music.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to get similar music: $e');
    }
  }


  @override
  bool canFetchNext() {
    return _nextPageUrl != null;
  }
}