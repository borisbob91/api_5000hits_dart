import 'dart:convert';
import 'package:api_5000hits/src/features/album/mp3_album.dart';
import 'package:api_5000hits/src/features/music/mp3_music.dart';
import 'package:api_5000hits/src/features/artist/mp3_artist.dart';
import 'package:api_5000hits/src/utils/api_client.dart';
import 'package:api_5000hits/src/exceptions/artist_exceptions.dart';
import 'package:dio/dio.dart';

import '../mp3_Artist_remote_repository_interface.dart';

class Mp3ArtistRemoteRepositoryImplement implements Mp3ArtistRemoteRepositoryInterface {
  final ApiClient apiClient;
  String? nextPage;
  int? count;

  @override
  final String route = '/api/v1/artists';

  Mp3ArtistRemoteRepositoryImplement(this.apiClient);

  Future<List<Mp3Artist>> _decodeArtistResponse(Response<dynamic> response) async {
    final responseData = jsonDecode(response.toString());
    final List<dynamic> data = responseData['results'];
    nextPage = responseData['next'];
    count = responseData['count'];
    return data.map((json) => Mp3Artist.fromJson(json)).toList();
  }

  @override
  Future<List<Mp3Artist>> fetchArtists({
    String? name,
    String? country,
    String? search,
    int? limit,
    int? page,
  }) async {
    try {
      final response = await apiClient.get(route, queryParameters: {
        if (name != null) 'name': name,
        if (country != null) 'country': country,
        if (search != null) 'search': search,
        if (limit != null) 'limit': limit,
        if (page != null) 'offset': page,
      });
      return await _decodeArtistResponse(response);
    } catch (error) {
      print("****new artist fetch error: $error");
      throw ArtistFetchException('Failed to fetch artists: $error');
    }
  }

  @override
  Future<Mp3Artist> getArtistBySlug({required String slug}) async {
    try {
      final response = await apiClient.get('$route/$slug/');
      final Map<String, dynamic> data = response.data;
      return Mp3Artist.fromJson(data);
    } catch (error) {
      throw ArtistReadException('Failed to fetch artist by slug: $error');
    }
  }

  @override
  Future<List<Mp3Album>> getArtistAlbums( {required String slug, int? limit, int? page}) async {
    try {
      final response = await apiClient.get('$route/$slug/albums/', queryParameters: {
        if (limit != null) 'limit': limit,
        if (page != null) 'offset': page,
      });
      final responseData = jsonDecode(response.toString());
      final List<dynamic> data = responseData['results'];
      return data.map((json) => Mp3Album.fromJson(json)).toList();
    } catch (error) {
      throw ArtistReadException('Failed to fetch artist albums: $error');
    }
  }

  @override
  Future<List<Mp3Music>> getArtistTracks({required String slug, int? limit, int? page}) async {
    try {
      final response = await apiClient.get('$route/$slug/tracks/', queryParameters: {
        if (limit != null) 'limit': limit,
        if (page != null) 'page': page,
      });
      final responseData = jsonDecode(response.toString());
      final List<dynamic> data = responseData['results'];
      return data.map((json) => Mp3Music.fromJson(json)).toList();
    } catch (error) {
      throw ArtistReadException('Failed to fetch artist tracks: $error');
    }
  }

  @override
  Future<List<Mp3Artist>> fetchNextArtists() async {
    if (!canFetchNext()) {
      return [];
    }
    try {
      final response = await apiClient.get(nextPage!);
      return await _decodeArtistResponse(response);
    } catch (error) {
      print("****new artist fetch next error: $error");
      throw ArtistFetchException('Failed to fetch next artists: $error');
    }
  }

  @override
  bool canFetchNext() {
    return nextPage != null && nextPage!.isNotEmpty;
  }
}