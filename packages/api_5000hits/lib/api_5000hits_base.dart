part of 'api_5000hits.dart';

class MusicSdk  with InitializationMixin{
  late final Music _music;
  late final AlbumContrat _albumContrat;
  late final MusicContrat _musicContrat;
  late final AuthContrat _authContrat;
  late final ArtistContrat _artistContrat;
  late final LyricContrat _lyricContrat;

  static String _apiKey = "";
  bool _appInit = false;

  static final MusicSdk _instance = MusicSdk._internal();

  factory MusicSdk() {
    print("*************** SDK factory initialisatin *************************");
    return _instance;
  }

  MusicSdk._internal(){
      _music = Music();
      _albumContrat = AlbumContrat();
      _musicContrat = MusicContrat();
      _authContrat =AuthContrat();
      _artistContrat = ArtistContrat();
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


  Music? get music{
    if (checkInitialization()){
      return _music;
    }
    return null;
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


