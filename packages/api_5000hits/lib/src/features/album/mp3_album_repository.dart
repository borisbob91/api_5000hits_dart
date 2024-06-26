import 'dart:convert';
import 'package:api_5000hits/src/utils/base_repository.dart';
import 'mp3_album.dart';
import 'package:dio/src/response.dart';
part 'mp3_album_base_repository.dart';

class Mp3AlbumRepository extends BaseRepository implements Mp3AlbumRepositoryInterface{
  // final ApiClient _apiClient;
    String? nextPage = "";
    int? count = 0;
    final String route= '/albums';

  Mp3AlbumRepository();

  @override
  Future<List<Mp3Album>> fetchAlbums() async {
    try {
      final response = await apiClient.get('/albums');
      return await _decodeResponse(response);
    } catch (error) {
      throw Exception('Failed to fetch albums to repo: $error');
    }
  }

  Future<List<Mp3Album>> _decodeResponse(Response<dynamic> response) async {
    final respnseData = jsonDecode(response.toString());
    final List<dynamic> data = respnseData['results'];
    nextPage = respnseData['next'];
    count = respnseData['count'];
    return  data.map((json) => Mp3Album.fromJson(json)).toList();
  }

  @override
  Future<Mp3Album> getAlbumBySlug(String slug) async {
    try {
      final response = await apiClient
          .get('/albums/$slug/', queryParameters: {'slug': slug});
      final Map<String, dynamic> data = response.data;
      return Mp3Album.fromJson(data);
    } catch (error) {
      throw Exception('Failed to fetch album by slug: $error');
    }
  }

  @override
  Future<List<Mp3Album>> fetchNextAlbums() async {
    String? url = nextPage;
    if(!canFetchNext()){
      print("can not next url");
      return [];
    }
    nextPage = "";
    try {
      final response = await apiClient.get(route, queryParameters: _extractOffsetAndLimit(url!));
      return _decodeResponse(response);
    } catch (error) {
      throw Exception('Failed to fetch albums: $error');
    }
  }

  @override
  bool canFetchNext() {
    return nextPage!.isNotEmpty;
  }
  Map<String, dynamic> _extractOffsetAndLimit(String url) {
      Uri uri = Uri.parse(url);
      int offset = int.tryParse(uri.queryParameters['offset'] ?? '') ?? 0;
      int limit = int.tryParse(uri.queryParameters['limit'] ?? '') ?? 100; // Valeur par défaut si limit n'est pas spécifié
      return {'offset': offset, 'limit': limit};
    }
}
