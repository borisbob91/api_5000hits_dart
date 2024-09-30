// auth_service.dart

import 'auth_state.dart';

abstract interface class AuthService {
  Future<AuthState> signIn({
    required String email,
    required String password,
    bool catchToken=true,
  });
  
  Future<bool> refreshToken();

  Future<void> signOut();
  
  Future<AuthState> getCurrentAuthState();
  
  Future<bool> isAuthenticated();
}