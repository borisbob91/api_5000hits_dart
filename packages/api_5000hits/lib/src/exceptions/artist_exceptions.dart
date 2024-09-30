class ArtistFetchException implements Exception {
  final String message;
  ArtistFetchException(this.message);
  @override
  String toString() => 'AlbumFetchException: $message';
}

class ArtistReadException implements Exception {
  final String message;
  ArtistReadException(this.message);
  @override
  String toString() => 'AlbumReadException: $message';
}