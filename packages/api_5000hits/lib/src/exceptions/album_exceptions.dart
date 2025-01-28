 class AlbumFetchException implements Exception {
    final String message;
    final int? statusCode;
    AlbumFetchException(this.message, [this.statusCode=0]);
    @override
    String toString() => 'AlbumFetchException: $message code: $statusCode';
  }

   class AlbumReadException implements Exception {
    final String message;
       final int? statusCode;
    AlbumReadException(this.message, {this.statusCode =0});
    @override
    String toString() => 'AlbumReadException: $message statusCode: $statusCode';
  }