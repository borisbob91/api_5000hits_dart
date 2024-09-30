import 'auth_model.dart';
import 'mp3_user.dart';

abstract class AuthLocalRepository {
  Future<void> saveToken(Token token);
  Future<Token?> getToken();
  Future<void> deleteToken();
  Future<void> saveUserProfile(Mp3User user);
  Future<Mp3User?> getUserProfile();
  Future<void> deleteUserProfile();
   Future<bool> isTokenExpired();
}