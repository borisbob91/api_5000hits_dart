
import '../../../core/databases/isar_manager.dart';
import '../auth_local_repository.dart';
import '../auth_model.dart';
import '../mp3_user.dart';

class AuthLocalRepositoryImpl implements AuthLocalRepository {
  final IsarManager _isarManager;

  AuthLocalRepositoryImpl(this._isarManager){
    _isarManager.initialize();
    //_isarManager.addSchema(TokenSchema);
  }

  @override
  Future<void> saveToken(Token token) async {
    final isar = await _isarManager.getIsar();
    await isar.writeTxn(() async {
      await isar.tokens.put(token);
    });
  }

  @override
  Future<Token?> getToken() async {
    final isar = await _isarManager.getIsar();
    return await isar.tokens.get(1); //  use ID 1 for the token
  }

  @override
  Future<void> deleteToken() async {
    await _isarManager.isar.writeTxn(() async {
      await _isarManager.isar.tokens.delete(1);
    });
  }

  @override
  Future<void> saveUserProfile(Mp3User user) async {
    await _isarManager.isar.writeTxn(() async {
      await _isarManager.isar.mp3Users.put(user);
    });
  }

  @override
  Future<Mp3User?> getUserProfile() async {
    return await _isarManager.isar.mp3Users.get(1); // Assuming we always use ID 1 for the user
  }

  @override
  Future<void> deleteUserProfile() async {
    await _isarManager.isar.writeTxn(() async {
      await _isarManager.isar.mp3Users.delete(1);
    });
  }
  
  @override
  Future<bool> isTokenExpired() async {
    final token = await getToken();
    if (token == null || token.expire == null) return true;
    
    final expireDate = DateTime.parse(token.expire!);
    return DateTime.now().isAfter(expireDate);
  }
}