class LyricFetchException implements Exception {
  final String message;
  LyricFetchException(this.message);
  @override
  String toString() => 'AlbumFetchException: $message';
}

class LyricNotFoundException implements Exception {
  final String message;
  LyricNotFoundException(this.message);
  @override
  String toString() => 'LyricNotFoundException: $message';
}