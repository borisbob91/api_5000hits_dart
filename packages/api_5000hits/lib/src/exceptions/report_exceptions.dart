
class ReportException implements Exception {
  final String message;
   String type;
  ReportException(this.message, {this.type='get'});
  @override
  String toString() => 'ReportFetchException:msg: $message  methode: $type';
}
