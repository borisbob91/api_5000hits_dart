 class AlbumFetchException implements Exception {
    final String message;
    AlbumFetchException(this.message);
    @override
    String toString() => 'AlbumFetchException: $message';
  }

   class AlbumReadException implements Exception {
    final String message;
    AlbumReadException(this.message);
    @override
    String toString() => 'AlbumReadException: $message';
  }