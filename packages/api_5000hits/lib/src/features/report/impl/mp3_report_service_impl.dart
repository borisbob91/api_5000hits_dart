// mp3_report_service_impl.dart


import '../mp3_report.dart';
import '../report_interface.dart';

class Mp3ReportServiceImpl implements Mp3ReportServiceInterface {
final Mp3RemoteReportRepositoryInterface _remoteRepository;

Mp3ReportServiceImpl(this._remoteRepository);

@override
Future<List<Mp3Report>> getReports({
String? username,
int page = 0,
int pageSize = 20,
}) async {
return await _remoteRepository.fetchReports(
username: username,
offset: page * pageSize,
limit: pageSize,
);
}

@override
Future<Mp3Report> submitReport(Mp3Report report) async {
return await _remoteRepository.createReport(report);
}
}

// report_exceptions.dart
class ReportException implements Exception {
final String message;
final String type;

ReportException(this.type, this.message);

@override
String toString() => '$type: $message';
}

class ReportFetchException extends ReportException {
ReportFetchException(String message) : super('ReportFetchError', message);
}

class ReportCreateException extends ReportException {
ReportCreateException(String message) : super('ReportCreateError', message);
}