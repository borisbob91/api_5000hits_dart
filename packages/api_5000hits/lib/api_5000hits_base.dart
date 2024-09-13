part of 'api_5000hits.dart';

class MusicSdk  with InitializationMixin{
  late final Music _music;
  late final AlbumContrat _albumContrat;
  late final MusicContrat _musicContrat;
  late final AuthContrat _authContrat;
  static String _apiKey = "";
  bool _appInit = false;

  static final MusicSdk _instance = MusicSdk._internal();

  factory MusicSdk() {
    print("***************sdk factory initialisatin:");
    return _instance;
  }

  MusicSdk._internal(){
    _music = Music();
    _albumContrat = AlbumContrat();
    _musicContrat = MusicContrat();
    _authContrat =AuthContrat();
    return;
  }


  MusicSdk init({required String key}) {
    print("initialisation instance");
    _apiKey = key;
    _appInit = _verifyApiKey(key);
    if(_appInit){
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
  
  static MusicSdk get instance {

    return _instance;
  }

  bool _verifyApiKey(String key) {
    print('*********Configuration de la clé API ***********');
    List p = key.split('.');
    print("************************************key len ${p.length}");
    if(_apiKey.isEmpty && p.length != 2){
      throw AuthError( ApiErrorTypes.providerDeveloperApiKey.name, "Please provide a developer api key",);
    }
    return true;
  }

  @override
  bool get appInit =>  _appInit;

}


