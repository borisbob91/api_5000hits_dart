import 'dart:convert';

import 'package:api_5000hits/src/exceptions/album_exceptions.dart';
import 'package:api_5000hits/src/utils/api_client.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../exceptions/music_exceptions.dart';
import '../mp3_music.dart';
import '../mp3_music_remote_repository.dart';

final logger = Logger();

class Mp3MusicRemoteRepositoryImplement implements Mp3MusicRemoteRepository {
  late final ApiClient _apiClient;
  final String _route = '/api/v1/musics';
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
      throw MusicFetchException('Failed to fetch music: $e');
    }
  }

  // @override
  // Future<Mp3Music> getMusicBySlug(String slug) async {
  //   try {
  //     final response = await _apiClient.get('$_route/$slug');
  //      final responseData = jsonDecode(response.toString());
  //     return Mp3Music.fromJson(response.data as Map<String, dynamic> );
  //   } catch (e) {
  //     logger.e('e: $e');
  //     throw Exception('Failed to get music by slug: $e from remote repository: trace: getMsuicBySlug');
  //   }
  // }
  @override
  Future<Mp3Music> getMusicBySlug(String slug) async {
    try {
      final response = await _apiClient.get('$_route/$slug');

      // Vérifiez si la réponse est déjà un objet JSON
      final responseData =
          response.data is String ? jsonDecode(response.data) : response.data;

      // Assurez-vous que responseData est bien un Map<String, dynamic>
      if (responseData is Map<String, dynamic>) {
        return Mp3Music.fromJson(responseData);
      } else {
        throw Exception(
            'Invalid response format: expected Map<String, dynamic>');
      }
    } catch (e) {
      logger.e('e: $e');
      throw Exception(
          'Failed to get music by slug: $e from remote repository: trace: getMusicBySlug');
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
  Future<List<Mp3Music>> searchMusic(String query,
      {int limit = 20, int offset = 0}) async {
    return fetchMusic(search: query, limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getRecentMusic(
      {int limit = 20, int offset = 0}) async {
    return fetchMusic(
        sortBy: 'uploaded', sortDesc: true, limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getMusicByArtist(String artist,
      {int limit = 20, int offset = 0}) async {
    return fetchMusic(artist: artist, limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getMusicByAlbum(String album,
      {int limit = 20, int offset = 0}) async {
    return fetchMusic(album: album, limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getMusicByGenre(String genre,
      {int limit = 20, int offset = 0}) async {
    return fetchMusic(genre: genre, limit: limit, offset: offset);
  }

  @override
  Future<List<Mp3Music>> getSimilarMusic(String musicSlug,
      {int limit = 20, page = 1}) async {
    try {
      final response = await _apiClient.get('$_route/$musicSlug/simulars',
          queryParameters: {'limit': limit, 'page': page});
      final List<dynamic> data = response.data['results'];
      return data.map((json) => Mp3Music.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to get similar music: $e');
    }
  }

  @override
  Future<List<Mp3Music>> getPopularMusic({int limit = 20, int page = 0}) async {
    try {
      final response = await _apiClient.get('$_route/populars/',
          queryParameters: {'limit': limit, 'page': page});
      final List<dynamic> data = response.data['results'];
      return data.map((json) => Mp3Music.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to get similar music: $e');
    }
  }

  @override
  Future<List<Mp3Music>> getMusicForArtistBySlug(
      {required String musicSlug, int limit = 20, int page = 0}) async {
    try {
      final response = await _apiClient.get('$_route/$musicSlug/artist',
          queryParameters: {'limit': limit, 'page': page});
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

  Future<List<Mp3Music>> _decodeResponse(Response<dynamic> response) async {
    final respnseData = jsonDecode(response.toString());
    final List<dynamic> data = respnseData['results'];
    print('results: $data');
    var nextPage = respnseData['next'];
    var count = respnseData['count'];
    return data.map((json) => Mp3Music.fromJson(json)).toList();
  }

  Map<String, dynamic> _extractOffsetAndLimit(String url) {
    Uri uri = Uri.parse(url);
    int offset = int.tryParse(uri.queryParameters['offset'] ?? '') ?? 0;
    int limit = int.tryParse(uri.queryParameters['limit'] ?? '') ??
        100; // Valeur par défaut si limit n'est pas spécifié
    return {'offset': offset, 'limit': limit};
  }
}
