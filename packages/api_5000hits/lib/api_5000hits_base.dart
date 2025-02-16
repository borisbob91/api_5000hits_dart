part of 'api_5000hits.dart';

final logger = Logger();
class MusicSdk  with InitializationMixin{
  late final AlbumContrat _albumContrat;
  late final MusicContrat _musicContrat;
  late final AuthContrat _authContrat;
  late final ArtistContrat _artistContrat;
  late final LyricContrat _lyricContrat;
  late final VideoContrat _videoContrat;
  late final AlbumReleaseContrat _albumReleaseContrat;
  late final ReportContract _reportContract;

  static String _apiKey = "";
  bool _appInit = false;

  static final MusicSdk _instance = MusicSdk._internal();

  factory MusicSdk() {
    logger.i('*********SDK factory initialisatin *************************');
    IsarManager().getIsar();
    return _instance;
  }

  MusicSdk._internal(){
      _albumContrat = AlbumContrat();
      _musicContrat = MusicContrat();
      _authContrat =AuthContrat();
      _artistContrat = ArtistContrat();
      _videoContrat = VideoContrat();
      _lyricContrat = LyricContrat();
      _reportContract = ReportContract();
      _albumReleaseContrat = AlbumReleaseContrat();
      return;
  }


  MusicSdk init({required String key}) {
    _appInit = _verifyApiKey(key);
    print('**********object $_appInit ***********');
    if(_appInit){
      _apiKey = key;
      print("initialisation ok");
     ApiClient().setApiKey(key);
    }
    return this;
  }

  AlbumContrat? get albumContrat{
    if(checkInitialization()){
      return _albumContrat;
    }
    return null;
  }
  MusicContrat? get musicContrat{
    if(checkInitialization()){
      return _musicContrat;
    }
    return null;
  }
    AuthContrat? get auth{
    if(checkInitialization()){
      return _authContrat;
    }
    return null;
  }

  ArtistContrat? get artist{
    if(checkInitialization()){
      return _artistContrat;
    }
    return null;
  }

  LyricContrat? get lyricContrat {
    if (checkInitialization()) {
      return _lyricContrat;
    }
    return null;
  }

  VideoContrat? get videoContrat {
    if (checkInitialization()) {
      return _videoContrat;
    }
    return null;
  }
  AlbumReleaseContrat? get albumRelease{
    if (checkInitialization()){
      return _albumReleaseContrat;
    }
  }
  ReportContract? get reportContract {
    if (checkInitialization()) {
      return _reportContract;
    }
    return null;
  }
  static MusicSdk get instance {

    return _instance;
  }

  bool _verifyApiKey(key) {
    print('*********Configuration de la clé API ***********$key');
    List p = key.split('.');
    if(p.length != 2){
      throw SdkException( ApiErrorTypes.providerDeveloperApiKey.name, "Please provide a developer api key");
    }
    return true;
  }

  @override
  bool get appInit =>  _appInit;

}


