
// mp3_report_remote_repository_impl.dart
import 'dart:convert';
import 'package:api_5000hits/src/exceptions/report_exceptions.dart';
import 'package:api_5000hits/src/utils/api_client.dart';
import 'package:dio/dio.dart';

import '../mp3_report.dart';
import '../report_interface.dart';


class Mp3ReportRemoteRepositoryImpl implements Mp3RemoteReportRepositoryInterface {
  final ApiClient apiClient;
  @override
  final String route = '/api/v1/reports';

  Mp3ReportRemoteRepositoryImpl({required this.apiClient});

  Future<List<Mp3Report>> _decodeResponse(Response<dynamic> response) async {
    final responseData = jsonDecode(response.toString());
    final List<dynamic> data = responseData['results'] ?? [responseData];
    return data.map((json) => Mp3Report.fromJson(json)).toList();
  }

  @override
  Future<List<Mp3Report>> fetchReports({
    String? username,
    int? limit,
    int? offset,
  }) async {
    try {
      final response = await apiClient.get(route, queryParameters: {
        if (username != null) 'username': username,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      });
      return await _decodeResponse(response);
    } catch (error) {
      throw ReportException('Failed to fetch reports: $error', type: 'Fetch');
    }
  }

  @override
  Future<Mp3Report> createReport(Mp3Report report) async {
    try {
      final response = await apiClient.post(
        route,
        report.toJson(),
      );
      return Mp3Report.fromJson(response.data);
    } catch (error) {
      throw ReportException('Failed to create report: $error', type: 'Create');
    }
  }
}