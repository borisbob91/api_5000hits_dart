

import '../../../utils/api_client.dart';
import '../mp3_video.dart';
import '../mp3_video_remote_repository.dart';

class Mp3VideoRemoteRepositoryImpl implements Mp3VideoRemoteRepository {
  final ApiClient apiClient;
  final String _route = '/api/v1/videos';
  String? _nextPageUrl;

  Mp3VideoRemoteRepositoryImpl({required this.apiClient});

  @override
  Future<List<Mp3Video>> fetchVideos({String? search,String? artist, String? title,String? genre, int? country, int limit = 20, int page = 1}) async {
    final response = await apiClient.get(_route, queryParameters: {
      'limit': limit,
      'page': page,
      if (search != null) 'search': search,
      if (title != null) 'title': title,
      if (genre != null) 'genre': genre,
      if (artist != null) 'artist': artist,
      if (country != null) 'country': country,
    });
    _nextPageUrl = response.data['next'];
    return (response.data['results'] as List).map((json) => Mp3Video.fromJson(json)).toList();
  }

  @override
  Future<Mp3Video> getVideoBySlug({required String slug}) async {
    final response = await apiClient.get('$_route/$slug/');
    return Mp3Video.fromJson(response.data);
  }

}