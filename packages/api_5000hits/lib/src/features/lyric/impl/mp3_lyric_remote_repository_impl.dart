import 'dart:convert';
import 'package:api_5000hits/src/features/lyric/mp3_lyric.dart';
import 'package:api_5000hits/src/utils/api_client.dart';
import 'package:api_5000hits/src/exceptions/lyric_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../mp3_lyric_remote_repository.dart';
final logger = Logger();
class Mp3LyricRemoteRepositoryImpl implements Mp3LyricRemoteRepository {
  final ApiClient _apiClient;
  final String _baseUrl = '/api/v1/lyrics2/';

  Mp3LyricRemoteRepositoryImpl(this._apiClient);

  @override
  Future<List<Mp3Lyric>> fetchLyrics({
    String? search,
    int? country,
    String? title,
    String? artist,
    String? genre,
    int limit = 20,
    int page = 0
  }) async {
    try {
      final response = await _apiClient.get(_baseUrl, queryParameters: {
        if (search != null) 'search': search,
        if (country != null) 'country': country,
        if (title != null) 'title': title,
        if (artist != null) 'artist': artist,
        if (genre != null) 'genre': genre,
        'limit': limit,
        'page': page,
      });

      return await _decodeResponse(response);
    } catch (e) {
      logger.f("fatal error while mapping lyric data");
      logger.e(e);
      throw LyricFetchException('Failed to fetch lyrics: $e');
    }
  }

  @override
  Future<Mp3Lyric> getLyricBySlug(String slug) async {
    try {
      final response = await _apiClient.get('$_baseUrl$slug');
      return Mp3Lyric.fromJson(json.decode(response.data));
    } catch (e) {
      throw LyricNotFoundException('Lyric not found for slug $slug: $e');
    }
  }

    Future<List<Mp3Lyric>> _decodeResponse(Response<dynamic> response) async {
    final responseData = jsonDecode(response.toString());
    final List<dynamic> data = responseData['results'];
    return data.map((json) => Mp3Lyric.fromJson(json)).toList();
  }
}