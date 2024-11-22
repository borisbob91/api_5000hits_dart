import 'dart:convert';
import 'package:api_5000hits/src/exceptions/album_exceptions.dart';
import 'package:api_5000hits/src/features/releases/mp3_album_release_remote_repo.dart';
import 'package:api_5000hits/src/utils/api_client.dart';
import 'package:api_5000hits/src/features/releases/mp3_album_release.dart';
import 'package:dio/dio.dart';

class Mp3AlbumReleaseRemoteRepositoryImpl implements Mp3AlbumReleaseRemoteRepository {
  final ApiClient apiClient;
  String? nextPage = "";
  int? count = 0;

  @override
  final String route = '/api/v1/albums-releases';

  Mp3AlbumReleaseRemoteRepositoryImpl({required this.apiClient});

  Future<List<Mp3AlbumRelease>> _decodeResponse(Response<dynamic> response) async {
    final responseData = jsonDecode(response.toString());
    final List<dynamic> data = responseData['results'];
    nextPage = responseData['next'];
    count = responseData['count'];
    return data.map((json) => Mp3AlbumRelease.fromJson(json)).toList();
  }

  @override
  Future<List<Mp3AlbumRelease>> fetchAlbumReleases({
    String? search,
    int? limit,
    int? offset,
  }) async {
    try {
      final response = await apiClient.get(route, queryParameters: {
        if (search != null) 'search': search,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      });
      return await _decodeResponse(response);
    } catch (error) {
      throw AlbumFetchException('Failed to fetch album releases: $error');
    }
  }

  @override
  Future<Mp3AlbumRelease> getAlbumById(int id) async {
    try {
      final response = await apiClient.get('$route/$id/');
      final Map<String, dynamic> data = response.data;
      return Mp3AlbumRelease.fromJson(data);
    } catch (error) {
      throw AlbumReadException('Failed to fetch album release by ID: $error');
    }
  }
}