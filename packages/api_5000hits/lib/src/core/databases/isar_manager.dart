import 'package:api_5000hits/src/features/album/mp3_album.dart';
import 'package:api_5000hits/src/features/album/mp3_cover.dart';
import 'package:api_5000hits/src/features/user/auth_model.dart';
import 'package:api_5000hits/src/features/user/mp3_user.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarManager {
  static final IsarManager _instance = IsarManager._internal();
  
  factory IsarManager() {
    return _instance;
  }

  IsarManager._internal(){
    initialize();
  }

  Isar? _isar;
  final List<CollectionSchema<dynamic>> _schemas = [Mp3AlbumSchema, Mp3CoverSchema, Mp3UserSchema, TokenSchema];

  void addSchema<T>(CollectionSchema<T> schema) {
    if (!_schemas.contains(schema)) {
      _schemas.add(schema);
    }
  }

  Future<void> initialize() async {
    print("Initial Isar mamanger");
    if (_isar != null) return;

    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      _schemas,
      directory: dir.path,
    );
  }

  Isar get isar {
    if (_isar == null) {
       initialize();
      // throw StateError('Isar has not been initialized. Call initialize() first form isar manager.');
    }
    return _isar!;
  }
}