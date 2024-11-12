
import 'package:api_5000hits/src/features/auth/auth_state.dart';
import 'package:api_5000hits/src/features/auth/impl/auth_local_repository_impl.dart';
import 'package:api_5000hits/src/features/auth/impl/auth_remote_repository_impl.dart';
import 'package:api_5000hits/src/features/auth/impl/auth_service_impl.dart';
import 'package:api_5000hits/src/utils/api_client.dart';

import 'src/core/databases/isar_manager.dart';
import 'src/features/auth/auth_service.dart';

class AuthContrat implements AuthService {
  static AuthContrat? _instance;
  late final AuthService _service;

  factory AuthContrat() {
    if (_instance == null) {
      print('auth contrat init');
      final localDb = AuthLocalRepositoryImpl(IsarManager());
      final remoteDb = AuthRemoteRepositoryImpl(ApiClient());
      _instance = AuthContrat._internal(remoteRepository: remoteDb, localRepository: localDb);
    }
    return _instance!;
  }

  AuthContrat._internal(
  
  {  required AuthRemoteRepositoryImpl remoteRepository,
     required AuthLocalRepositoryImpl localRepository}
  ) {
    _service = AuthServiceImpl(remoteRepository,localRepository);
  }

  @override
  Future<AuthState> getCurrentAuthState() async{
    return await _service.getCurrentAuthState();
  }

  @override
  Future<bool> isAuthenticated() async {
    return await _service.isAuthenticated();
  }

  @override
  Future<bool> refreshToken() async {
    return await _service.refreshToken();
  }

  @override
  Future<AuthState> signIn({required String email, required String password, bool catchToken = true}) async {
    return await _service.signIn(email: email, password: password);
  }

  @override
  Future<void> signOut() async{
    return _service.signOut();
  }
 
}


