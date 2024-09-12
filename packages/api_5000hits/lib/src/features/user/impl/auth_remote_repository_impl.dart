import 'package:api_5000hits/src/utils/api_client.dart';
import 'package:dio/dio.dart';

import '../auth_model.dart';
import '../auth_remote_repository.dart';
import '../exceptions.dart';
import '../mp3_user.dart';

class AuthRemoteRepositoryImpl implements AuthRemoteRepository {
  final ApiClient _apiClient;

  AuthRemoteRepositoryImpl(this._apiClient);

  @override
  Future<Token> obtainToken({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post('$route/',  {
        'email': email,
        'password': password,
      });
      final token = Token.fromJson(response.data);
      _apiClient.setToken(token.access!);
      return token;
    } on DioException catch (e) {
      throw AuthException(message: e.response?.data['detail'] ?? 'Unknown error when signIn', code: "invalid_login_data");
    }
  }

  @override
  Future<Token> refreshToken(String refreshToken) async {
    try {
      final response = await _apiClient.post('$route/refresh/', {
        'refresh': refreshToken,
      });
      final token= Token.fromJson(response.data);
      _apiClient.setToken(token.access!);
      return token;
    } on DioException catch (e) {
      throw AuthException(message: e.response?.data['detail'] ?? 'Unknown error', code: 'invalide_token');
    }
  }

  @override
  Future<bool> verifyToken(String token) async {
    try {
     await _apiClient.post('$route/verify/', {
        'token': token,
      });
      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw AuthException.fromJson(e.response?.data);
      }
      _apiClient.clearToken();
      return false;
    }
  }
  
  @override
  Future<Mp3User> getUserProfile(String token) async {
    try {
      final response = await _apiClient.get('/user/profile/', 
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return Mp3User.fromJson(response.data);
    } on DioException catch (e) {
      throw AuthException(message: e.response?.data['detail'] ?? 'Failed to fetch user profile');
    }
  }
  
  @override
  String get route => '/token';
  
  @override
  void logOut() async {
    _apiClient.clearToken();
  }
}