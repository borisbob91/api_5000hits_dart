 class MusicReadException implements Exception {
    final String message;
    final int code;
    MusicReadException(this.message, {this.code=404});
    
    @override
    String toString() => 'MusicReadException: $message';
  }