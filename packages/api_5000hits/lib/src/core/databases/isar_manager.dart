import 'package:api_5000hits/src/features/_downloader/download_info.dart';
import 'package:api_5000hits/src/features/album/mp3_album.dart';
import 'package:api_5000hits/src/features/album/mp3_cover.dart';
import 'package:api_5000hits/src/features/auth/auth_model.dart';
import 'package:api_5000hits/src/features/auth/mp3_user.dart';
import 'package:api_5000hits/src/features/lyric/mp3_lyric.dart';
import 'package:api_5000hits/src/features/music/mp3_music.dart';
import 'package:api_5000hits/src/features/video/mp3_video.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarManager {
  // static final IsarManager _instance = IsarManager._internal();
  static  IsarManager? _instance;

  Isar? _isar;

  factory IsarManager() {
    // _instance ??= IsarManager._internal();
    if (_instance == null){
      IsarManager._internal();
    }
    return _instance??=IsarManager._internal();
  }

  IsarManager._internal(){
    initialize();
  }


  final List<CollectionSchema<dynamic>> _schemas = [Mp3AlbumSchema,Mp3MusicSchema,Mp3LyricSchema, Mp3VideoSchema, Mp3CoverSchema, Mp3UserSchema, TokenSchema, DownloadInfoIsarSchema];

  void addSchema<T>(CollectionSchema<T> schema) {
    if (!_schemas.contains(schema)) {
      _schemas.add(schema);
    }
  }

  Future<Isar> initialize() async {
    if (_isar !=null){
      print("Isar is open! ^${_isar!.isOpen}");
      print("IsarManager is already initialized!");
      return _isar!;
    }else{
      print("Initial Isar mamanger");
    }

    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      _schemas,
      directory: dir.path,
    );
    return _isar!;
  }

  Isar get isar {
    if (_isar == null) {
       initialize();
      // throw StateError('Isar has not been initialized. Call initialize() first form isar manager.');
      return _isar!;
    }
    return _isar!;
  }
}
