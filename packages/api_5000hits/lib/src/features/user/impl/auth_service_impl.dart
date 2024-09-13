import '../auth_local_repository.dart';
import '../auth_model.dart';
import '../auth_remote_repository.dart';
import '../auth_service.dart';
import '../auth_state.dart';
import '../exceptions.dart';

class AuthServiceImpl implements AuthService {
  final AuthRemoteRepository _remoteRepository;
  final AuthLocalRepository _localRepository;
  late String? userToken;
  AuthServiceImpl(this._remoteRepository, this._localRepository);

  @override
  Future<AuthState> signIn({
    required String email,
    required String password,
    bool catchToken = true,
  }) async {
    try {
      final token = await _remoteRepository.obtainToken(
        email: email,
        password: password,
      );
      await _handleAuthResponse(token);
      return AuthState(
        isAuthenticated: true,
        token: token.access,
        userProfile: await _localRepository.getUserProfile(),
      );
    } on AuthException catch (e) {
      throw Exception('SignIn failed: ${e.message}');
    }
  }

  @override
  Future<bool> refreshToken() async {
    final token = await _localRepository.getToken();
    if (token?.refresh != null) {
      try {
        final newToken = await _remoteRepository.refreshToken(token!.refresh!);
        await _localRepository.saveToken(token.copyWith(access: newToken.access, refresh: newToken.refresh));
        return true;
      } on AuthException {
        return false;
      }
    }
    return false;
  }

  @override
  Future<void> signOut() async {
    _remoteRepository.logOut();
    await _localRepository.deleteToken();
    await _localRepository.deleteUserProfile();
  }

  @override
  Future<AuthState> getCurrentAuthState() async {
    final userProfile = await _localRepository.getUserProfile();
    final isAuthenticate = await isAuthenticated();
    return AuthState(
      isAuthenticated: isAuthenticate,
      token: isAuthenticate ? userToken : null,
      userProfile: isAuthenticate ? userProfile : null,
    );
  }

  Future<void> _handleAuthResponse(Token token) async {
    await _localRepository.saveToken(token);
    final userProfile = await _remoteRepository.getUserProfile(token.access!);
    await _localRepository.saveUserProfile(userProfile);
  }
  
  @override
 Future<bool> isAuthenticated() async {
    final token = await _getLocalToken();
    if (token == null) return false;

    final isExpired = await _localRepository.isTokenExpired();
    final isValidToken = await _remoteRepository.verifyToken(userToken!);
    if (isExpired || !isValidToken) {
      userToken = null;
     final refreshed = await refreshToken();
     if(!refreshed) {
      _localRepository.deleteToken();
     }
      return refreshed;
    }
    userToken = token.access;
    return true;
  }

  Future<Token?> _getLocalToken() async{
      return await _localRepository.getToken();
  }

  }
