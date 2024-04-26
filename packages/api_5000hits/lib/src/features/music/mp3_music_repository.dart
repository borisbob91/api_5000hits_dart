import 'dart:convert';
import 'package:api_5000hits/src/utils/base_repository.dart';
import 'package:api_5000hits/src/features/music/mp3_music.dart';
import 'package:dio/dio.dart';

part 'mp3_music_base_repository.dart';


class Mp3MusicRepository extends BaseRepository implements Mp3MusicRepositoryInterface{
  // final ApiClient _apiClient;
  String? nextPage = "";
  int? count = 0;
  final String route = '/musics/';

  Mp3MusicRepository();

  @override
  Future<List<Mp3Music>> fetchMusics() async {
    try {
      final response = await apiClient.get(route);
      return await _decodeResponse(response);
    } catch (error) {
      throw Exception('Failed to fetch music to repo: $error');
    }
  }

  Future<List<Mp3Music>> _decodeResponse(Response<dynamic> response) async {
    final respnseData = jsonDecode(response.toString());
    final List<dynamic> data = respnseData['results'];
    nextPage = respnseData['next'];
    count = respnseData['count'];
    return  data.map((json) => Mp3Music.fromJson(json)).toList();
  }

  @override
  Future<Mp3Music> getMusicBySlug(String slug) async {
    try {
      final response = await apiClient
          .get('$route$slug/', queryParameters: {'slug': slug});
      final Map<String, dynamic> data = response.data;
      return Mp3Music.fromJson(data);
    } catch (error) {
      throw Exception('Failed to fetch Music by slug: $error');
    }
  }

  @override
  Future<List<Mp3Music>> fetchNextMusic() async {
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
