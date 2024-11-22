// mp3_report_remote_repository_interface.dart
import 'mp3_report.dart';

abstract interface class Mp3RemoteReportRepositoryInterface {
  final String route = '/api/v1/reports';

  Future<List<Mp3Report>> fetchReports({
    String? username,
    int? limit,
    int? offset,
  });

  Future<Mp3Report> createReport(Mp3Report report);
}


// mp3_report_service_interface.dart
abstract interface class Mp3ReportServiceInterface {
  Future<List<Mp3Report>> getReports({
    String? username,
    int page = 0,
    int pageSize = 20,
  });

  Future<Mp3Report> submitReport(Mp3Report report);
}

