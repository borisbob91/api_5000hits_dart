class AuthException implements Exception {
  final String message;
  final String? code;

  AuthException({required this.message, this.code});

  factory AuthException.fromJson(Map<String, dynamic> json) {
    return AuthException(
      message: json['detail'],
      code: json['code'],
    );
  }
  
  @override
  String toString() {
    // TODO: implement toString
    return 'AuthException: $code , detail: $message' ;
  }
}