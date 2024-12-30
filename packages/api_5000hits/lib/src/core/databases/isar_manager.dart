import 'package:api_5000hits/src/features/_downloader/download_info.dart';
import 'package:api_5000hits/src/features/album/mp3_album.dart';
import 'package:api_5000hits/src/features/album/mp3_cover.dart';
import 'package:api_5000hits/src/features/auth/auth_model.dart';
import 'package:api_5000hits/src/features/auth/mp3_user.dart';
import 'package:api_5000hits/src/features/lyric/mp3_lyric.dart';
import 'package:api_5000hits/src/features/music/mp3_music.dart';
import 'package:api_5000hits/src/features/releases/mp3_album_release.dart';
import 'package:api_5000hits/src/features/releases/mp3_album_release_track.dart';
import 'package:api_5000hits/src/features/video/mp3_video.dart';
import 'package:api_5000hits/src/utils/cache_timestamp.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

final logger = Logger();
class IsarManager {
  //static final IsarManager _instance = IsarManager._internal();
  static  IsarManager? _instance;

  Isar? _isar;

  factory IsarManager() {
    // _instance ??= IsarManager._internal();
    // if (_instance == null){
    //   IsarManager._internal();
    // }
    return _instance??=IsarManager._internal();
  }

  IsarManager._internal(){
    initialize();
  }


  final List<CollectionSchema<dynamic>> _schemas = [Mp3AlbumSchema,Mp3MusicSchema,Mp3LyricSchema, Mp3VideoSchema, Mp3CoverSchema, Mp3UserSchema, TokenSchema, DownloadInfoIsarSchema, CacheTimestampSchema, Mp3AlbumReleaseSchema, Mp3AlbumReleaseTrackSchema];

  void addSchema<T>(CollectionSchema<T> schema) {
    if (!_schemas.contains(schema)) {
      _schemas.add(schema);
    }
  }

  Future<Isar> initialize() async {
    if (_isar !=null){
      logger.i("Isar is open! ^${_isar!.isOpen}");
      logger.i("IsarManager is already initialized!");
      return _isar!;
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
       logger.w("Isar has not been initialized. Call initialize() first form isar manager.");
       throw StateError('Isar has not been initialized. Call initialize() first form isar manager.');
      //return _isar!;
    }

    return _isar!;
  }

  // Getter asynchrone pour accéder à l'instance Isar
  Future<Isar> getIsar() async {
    if (_isar == null || !_isar!.isOpen) {
      return await initialize();
    }
    return _isar!;
  }

  // Méthode pour fermer proprement Isar
  Future<void> closeIsar() async {
    if (_isar != null && _isar!.isOpen) {
      await _isar!.close();
      _isar = null;
    }
  }

}

//
// import 'package:api_5000hits/src/features/_downloader/download_info.dart';
// import 'package:api_5000hits/src/features/album/mp3_album.dart';
// import 'package:api_5000hits/src/features/album/mp3_cover.dart';
// import 'package:api_5000hits/src/features/auth/auth_model.dart';
// import 'package:api_5000hits/src/features/auth/mp3_user.dart';
// import 'package:api_5000hits/src/features/lyric/mp3_lyric.dart';
// import 'package:api_5000hits/src/features/music/mp3_music.dart';
// import 'package:api_5000hits/src/features/releases/mp3_album_release.dart';
// import 'package:api_5000hits/src/features/releases/mp3_album_release_track.dart';
// import 'package:api_5000hits/src/features/video/mp3_video.dart';
// import 'package:api_5000hits/src/utils/cache_timestamp.dart';
// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
//
// class IsarManager {
//   // Instance unique (singleton)
//   static IsarManager? _instance;
//
//   // Instance de Isar
//   Isar? _isar;
//
//   // Getter pour accéder à l'instance unique
//   static IsarManager get instance {
//     _instance ??= IsarManager._internal();
//     return _instance!;
//   }
//
//   // Liste des schémas de collection
//   final List<CollectionSchema<dynamic>> schemas = [
//     Mp3AlbumSchema,
//     Mp3MusicSchema,
//     Mp3LyricSchema,
//     Mp3VideoSchema,
//     Mp3CoverSchema,
//     Mp3UserSchema,
//     TokenSchema,
//     DownloadInfoIsarSchema,
//     CacheTimestampSchema,
//     Mp3AlbumReleaseSchema,
//     Mp3AlbumReleaseTrackSchema
//   ];
//
//   // Constructeur privé
//   IsarManager._internal();
//
//   // Méthode pour ajouter un nouveau schéma
//   void addSchema<T>(CollectionSchema<T> schema) {
//     if (!schemas.contains(schema)) {
//       schemas.add(schema);
//     }
//   }
//
//   // Initialisation asynchrone de Isar
//   Future<Isar> initialize() async {
//     if (_isar != null && _isar!.isOpen) {
//       print("Isar est déjà initialisé et ouvert!");
//       return _isar!;
//     }
//
//     print("Initialisation d'Isar Manager");
//     final dir = await getApplicationDocumentsDirectory();
//
//     _isar = await Isar.open(
//       schemas,
//       directory: dir.path,
//     );
//
//     return _isar!;
//   }
//
//   // Getter asynchrone pour accéder à l'instance Isar
//   Future<Isar> getIsar() async {
//     if (_isar == null || !_isar!.isOpen) {
//       return await initialize();
//     }
//     return _isar!;
//   }
//
//   // Méthode pour fermer proprement Isar
//   Future<void> closeIsar() async {
//     if (_isar != null && _isar!.isOpen) {
//       await _isar!.close();
//       _isar = null;
//     }
//   }
// }