part of 'api_5000hits.dart';

class MusicSdk  with InitializationMixin{
  late final Album _album;
  late final Music _music;
  static String _apiKey = "";
  bool _appInit = false;

  static final MusicSdk _instance = MusicSdk._internal();

  factory MusicSdk() {
    print("***************sdk factory initialisatin:");
    return _instance;
  }

  MusicSdk._internal(){
    _album = Album();
    _music = Music();
  }


  MusicSdk init({required String key}) {
    print("initialisation instance");
    _apiKey = key;
    _verifyApiKey(key);
    _appInit = true;
    return this;
  }

  Album? get album{
    if (checkInitialization()){
    return _album;
    }
    return null;
  }
  Music? get music{
    if (checkInitialization()){
      return _music;
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