class ErrorHandler implements Exception {
  final String message;
  final String code;

  ErrorHandler(this.code, this.message);

  @override
  String toString() {
    return 'ErrorHandler: $message,  codeError: $code';
  }
}
