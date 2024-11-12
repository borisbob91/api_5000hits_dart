// auth_repository.dart

import 'auth_model.dart';
import 'mp3_user.dart';

abstract class AuthRemoteRepository {
  final String route= '/token/';
  
  Future<Token> obtainToken({
    required String email,
    required String password,
  });

  Future<Token> refreshToken(String refreshToken);

  Future<bool> verifyToken(String token);

  Future<Mp3User> getUserProfile(String token);
   void logOut();
}
