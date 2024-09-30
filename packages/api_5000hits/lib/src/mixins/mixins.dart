import 'package:api_5000hits/src/exceptions/error_handler.dart';
import 'package:api_5000hits/src/exceptions/error_types.dart';

mixin InitializationMixin {
  bool checkInitialization() {
    // Vérifie si appInit est à true
    print('verfie le appinit: $appInit');
    if (!appInit) {
      throw ErrorHandler(ApiErrorTypes.initializationError.name,"L'application n'est pas initialisée.  tester MusicSdk().init(key)");
    }
    return true;
  }

  bool get appInit;
}