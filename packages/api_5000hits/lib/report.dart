import '/src/utils/api_client.dart';

import 'src/features/report/impl/mp3_report_remote_repository_impl.dart';
import 'src/features/report/impl/mp3_report_service_impl.dart';

class ReportContract extends Mp3ReportServiceImpl {
  static ReportContract? _instance;

  factory ReportContract() {
    if (_instance == null) {
      print('report contract init');
      final apiClient = ApiClient();
      final remoteRepo = Mp3ReportRemoteRepositoryImpl(apiClient: apiClient);
      _instance = ReportContract._internal(remoteRepository: remoteRepo);
    }
    return _instance!;
  }

  ReportContract._internal({required Mp3ReportRemoteRepositoryImpl remoteRepository})
      : super(remoteRepository);
}