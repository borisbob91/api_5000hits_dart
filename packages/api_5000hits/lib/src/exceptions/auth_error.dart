import 'package:api_5000hits/src/exceptions/error_handler.dart';

class AuthError extends ErrorHandler{
  AuthError(super.code, super.message,);
}

 class SdkException implements Exception {
    final String message;
    final String code;
    SdkException(this.code, this.message,);
    @override
    String toString() => 'SdkException: $message';
  }