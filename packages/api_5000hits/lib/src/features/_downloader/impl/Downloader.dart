import 'dart:io';
import 'package:dio/dio.dart';

import '../interfaces.dart';

class Downloader implements DownloaderInterface {
  //final APiClient _apiClient;
  final Dio _dio;
  final SignatureGeneratorInterface _signatureGenerator;
  final String _baseUrl;
  final Map<String, CancelToken> _cancelTokens = {};

  Downloader(this._signatureGenerator, this._baseUrl) : _dio = Dio() {
    _dio.options.connectTimeout = Duration(seconds: 30);
    _dio.options.receiveTimeout = Duration(seconds: 60);
    _dio.options.baseUrl = _baseUrl;
  }

  @override
  Future<void> downloadFile(String url, String savePath, Function(int, int) onProgress) async {
    final cancelToken = CancelToken();
    _cancelTokens[url] = cancelToken;

    try {
      await _dio.download(
        url,
        savePath,
        cancelToken: cancelToken,
        onReceiveProgress: onProgress,
      );
    } finally {
      _cancelTokens.remove(url);
    }
  }

  @override
  Future<void> resumeDownload(String url, String savePath, int startByte, Function(int, int) onProgress) async {
    final cancelToken = CancelToken();
    _cancelTokens[url] = cancelToken;

    try {
      final response = await _dio.get(
        url,
        options: Options(
          responseType: ResponseType.stream,
          headers: {'Range': 'bytes=$startByte-'},
        ),
        cancelToken: cancelToken,
      );

      final file = File(savePath);
      final raf = await file.open(mode: FileMode.append);
      int received = startByte;
      int total = int.parse(response.headers.value('content-length') ?? '-1');

      await for (final chunk in response.data.stream) {
        await raf.writeFrom(chunk);
        received += chunk.length as int;
        onProgress(received, total);
      }

      await raf.close();
    } finally {
      _cancelTokens.remove(url);
    }
  }

  @override
  Future<void> pauseDownload(String url) async {
    _cancelTokens[url]?.cancel('Download paused');
    _cancelTokens.remove(url);
  }

  @override
  Future<void> cancelDownload(String url) async {
    _cancelTokens[url]?.cancel('Download cancelled');
    _cancelTokens.remove(url);
  }

  @override
  String getDownloadUrl(String slug) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final signature = _signatureGenerator.generateSignature(slug, timestamp);
    return '$_baseUrl/$slug?timestamp=$timestamp&signature=$signature';
  }
}