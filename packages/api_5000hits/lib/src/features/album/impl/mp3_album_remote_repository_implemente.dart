import 'dart:convert';

import 'package:api_5000hits/api_5000hits.dart';
import 'package:api_5000hits/src/utils/api_client.dart';
import 'package:dio/dio.dart';

import '../../../exceptions/album_exceptions.dart';
import '../mp3_album_remote_repository_interface.dart';



class Mp3AlbumRemoteRepositoryImplemente implements Mp3RemoteRepositoryInterface{
  
  final ApiClient apiClient;
    String? nextPage = "";
    int? count = 0;

    @override
    final String route= '/api/v1/albums';

  Mp3AlbumRemoteRepositoryImplemente({required this.apiClient});

 

  Future<List<Mp3Album>> _decodeResponse(Response<dynamic> response) async {
    final respnseData = jsonDecode(response.toString());
    final List<dynamic> data = respnseData['results'];
    print('results: $data');
    nextPage = respnseData['next'];
    count = respnseData['count'];
    return  data.map((json) => Mp3Album.fromJson(json)).toList();
  }

  @override
  Future<Mp3Album> getAlbumBySlug(String slug) async {
    try {
      final response = await apiClient
          .get('$route/$slug/');
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
      return await _decodeResponse(response);

    } catch (error) {
      throw AlbumFetchException(' $error');
    }
  }
    
     @override
  Future<List<Mp3Music>> getAlbumTracks(String slug,) async {
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
  

  
  @override
  Future<List<Mp3Album>> fetchMostDownloadAlbums({int page = 1, int pageSize = 20}) async{
    // TODO: implement mostDownloadAlbums
    try {
      final response = await apiClient.get('$route/most-downloaded/', queryParameters: {
        'page':page,
        'pageSize':pageSize,
        'size':pageSize
      });
      return _decodeResponse(response);
    } catch (error) {
      throw AlbumFetchException('Failed to fetch most downloaded album: $error');
    }
  }
  
  @override
  Future<List<Mp3Album>> fetchPopularsAlbums({int page = 1, int pageSize = 20}) async{
    // TODO: implement popularsAlbums
      try {
      final response = await apiClient.get('$route/populars/', queryParameters: {
        'page': page,
        'limit': pageSize,
              
      });
      return _decodeResponse(response);
    } catch (error) {
      throw AlbumFetchException('Failed to fetch most downloaded album: $error');
    }
  }
  
  @override
  Future<List<Mp3Album>> fetchSimularsAlbums(String slug, {int page = 0, int pageSize = 20}) async{
    // TODO: implement simularsMusics
    print('********** simulars albums');
      try {
      final response = await apiClient.get('$route/$slug/simulars/');
      return _decodeResponse(response);
    } catch (error) {
      throw AlbumFetchException('Failed to fetch asimulars album: $error');
    }
  }

  @override
  Future<List<Mp3Album>> fetchArtistAlbum({required String albumSlug}) async {
    try {
      final response = await apiClient.get('$route/$albumSlug/artist/');
      print("***********************artist albums fetch***********");
      print(response.data);
      return _decodeResponse(response);
    } catch (error) {
      throw AlbumFetchException('Failed to fetch album of artist: $error');
    }
  }

  }
    
