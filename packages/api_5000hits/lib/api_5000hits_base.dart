part of 'api_5000hits.dart';

class MusicSdk  with InitializationMixin{
  late final Music _music;
  late final AlbumContrat _albumContrat;
  late final MusicContrat _musicContrat;
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
    return;
  }


  MusicSdk init({required String key}) {
    print("initialisation instance");
    _apiKey = key;
    _verifyApiKey(key);
    _appInit = true;
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
  
  static MusicSdk get instance {

    return _instance;
  }

  bool _verifyApiKey(String key) {
    print('***********  verification');
    if(_apiKey.isEmpty){
      throw AuthError( ApiErrorTypes.providerDeveloperApiKey.name, "Please provide a developer api key",);
    }
    return false;
  }

  @override
  bool get appInit =>  _appInit;

}