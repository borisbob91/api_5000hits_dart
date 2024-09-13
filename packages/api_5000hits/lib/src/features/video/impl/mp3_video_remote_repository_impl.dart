import 'package:api_5000hits/src/utils/api_client.xxxdart';
import '../mp3_video.dart';
import '../mp3_video_remote_repository.dart';

class Mp3VideoRemoteRepositoryImpl implements Mp3VideoRemoteRepository {
  final ApiClient apiClient;
  String? _nextPageUrl;

  Mp3VideoRemoteRepositoryImpl({required this.apiClient});

  @override
  Future<List<Mp3Video>> fetchVideos({int limit = 20, int offset = 0}) async {
    final response = await apiClient.get('/api/videos/', queryParameters: {
      'limit': limit,
      'offset': offset,
    });
    _nextPageUrl = response.data['next'];
    return (response.data['results'] as List).map((json) => Mp3Video.fromJson(json)).toList();
  }

  @override
  Future<Mp3Video> getVideoByYtId(String ytId) async {
    final response = await apiClient.get('/api/videos/$ytId/');
    return Mp3Video.fromJson(response.data);
  }

  @override
  Future<List<Mp3Video>> searchVideos(String query, {int limit = 20, int offset = 0}) async {
    final response = await apiClient.get('/api/videos/search/', queryParameters: {
      'query': query,
      'limit': limit,
      'offset': offset,
    });
    return (response.data['results'] as List).map((json) => Mp3Video.fromJson(json)).toList();
  }

  @override
  Future<List<Mp3Video>> getPopularVideos({int limit = 20, int offset = 0}) async {
    final response = await apiClient.get('/api/videos/popular/', queryParameters: {
      'limit': limit,
      'offset': offset,
    });
    return (response.data['results'] as List).map((json) => Mp3Video.fromJson(json)).toList();
  }

  @override
  Future<List<Mp3Video>> getRecentVideos({int limit = 20, int offset = 0}) async {
    final response = await apiClient.get('/api/videos/recent/', queryParameters: {
      'limit': limit,
      'offset': offset,
    });
    return (response.data['results'] as List).map((json) => Mp3Video.fromJson(json)).toList();
  }

  @override
  bool canFetchNext() {
    return _nextPageUrl != null;
  }

  @override
  Future<List<Mp3Video>> fetchNextVideos() async {
    if (_nextPageUrl == null) {
      throw Exception('No more videos to fetch');
    }
    final response = await apiClient.get(_nextPageUrl!);
    _nextPageUrl = response.data['next'];
    return (response.data['results'] as List).map((json) => Mp3Video.fromJson(json)).toList();
  }

  @override
  Future<int> getVideoMusic(int videoId) async {
    final response = await apiClient.get('/api/videos/$videoId/music/');
    return response.data['music_id'];
  }
}