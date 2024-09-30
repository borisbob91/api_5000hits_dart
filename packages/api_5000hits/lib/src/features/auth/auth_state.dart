
// auth_state.dart

import 'package:api_5000hits/src/features/auth/mp3_user.dart';

class AuthState {
  final bool isAuthenticated;
  final String? token;
  final Mp3User? userProfile;

  AuthState({
    this.isAuthenticated = false,
    this.token,
    this.userProfile,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    String? token,
    Mp3User? userProfile,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
      userProfile: userProfile ?? this.userProfile,
    );
  }
}
