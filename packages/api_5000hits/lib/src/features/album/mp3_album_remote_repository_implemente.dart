import 'dart:convert';

import 'package:api_5000hits/api_5000hits.dart';
import 'package:dio/dio.dart';

import '../../exceptions/album_exceptions.dart';
import '../../utils/api_client.dart';

part 'mp3_album_remote_repository_interface.dart';


class Mp3AlbumRemoteRepositoryImplemente implements Mp3RemoteRepositoryInterface{
  
  final ApiClient apiClient;
    String? nextPage = "";
    int? count = 0;
    final String route= '/api/v1/albums';

  Mp3AlbumRemoteRepositoryImplemente({required this.apiClient});

 

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
          .get('$route/$slug/', queryParameters: {'slug': slug});
      final Map<String, dynamic> data = response.data;
      return Mp3Album.fromJson(data);
    } catch (error) {
      throw throw AlbumReadException('Failed to fetch album by slug: $error');
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
      throw AlbumFetchException(' $error');
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
    
   @override
  Future<List<Mp3Album>> fetchAlbums({
    String? artist,
    String? slug,
    String? name,
    String? year,
    String? genre,
    String? label,
    int? country,
    String? search,
    int? limit,
    int? offset,
  }) async {
     // TODO: implement fetchAlbums
    try {
      final response = await apiClient.get('$route', queryParameters: {
        if (artist != null) 'artist': artist,
        if (slug != null) 'slug': slug,
        if (name != null) 'name': name,
        if (year != null) 'year': year,
        if (genre != null) 'genre': genre,
        if (label != null) 'label': label,
        if (country != null) 'country': country,
        if (search != null) 'search': search,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,        
      });
      //final List<dynamic> data = response.data['results'];
      //return data.map((json) => Mp3Album.fromJson(json)).toList();
      return await _decodeResponse(response);

    } catch (error) {
      throw AlbumFetchException(' $error');
    }
  }
    
     @override
  Future<List<Mp3Music>> getAlbumTracks(String slug) async {
    // TODO: implement getAlbumTracks
    try {
      final response = await apiClient.get('$route/$slug/tracks/');
      final respnseData = jsonDecode(response.toString());
      final List<dynamic> data = respnseData['track_list'];
      return data.map((json) => Mp3Music.fromJson(json)).toList();
    } catch (error) {
      throw AlbumReadException('Failed to fetch album tracks: $error');
    }
  }
    

}