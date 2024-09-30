
import 'package:api_5000hits/src/features/user/impl/auth_local_repository_impl.dart';
import 'package:api_5000hits/src/features/user/impl/auth_remote_repository_impl.dart';
import 'package:api_5000hits/src/features/user/impl/auth_service_impl.dart';
import 'package:api_5000hits/src/utils/api_client.dart';

import 'src/core/databases/isar_manager.dart';

class AuthContrat extends AuthServiceImpl {
  static AuthContrat? _instance;


  factory AuthContrat() {
    if (_instance == null) {
      print('V contrat init');
      final isarManager = IsarManager();
      
      final apiClient = ApiClient();

      final localDb = AuthLocalRepositoryImpl(isarManager);
      final remoteDb = AuthRemoteRepositoryImpl(apiClient);

      _instance = AuthContrat._internal(remoteRepository: remoteDb, localRepository: localDb);
    }
    return _instance!;
  }

  AuthContrat._internal(
  
  {  required AuthRemoteRepositoryImpl remoteRepository,
     required AuthLocalRepositoryImpl localRepository}
  ) : super(remoteRepository, localRepository) {
    
    // Initialisation supplémentaire si nécessaire
  }
 
}


