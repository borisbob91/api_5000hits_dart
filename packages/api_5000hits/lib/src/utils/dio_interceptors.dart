import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:api_5000hits/src/features/auth/auth_local_repository.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../features/auth/impl/auth_local_repository_impl.dart';
// dio http custom exceptions class

class MusicSdkHttpError implements Exception {
  final String? error;
  final int? statusCode;
  final String? trace;

  // Constructor avec initialisation des champs
  MusicSdkHttpError(this.error, this.statusCode, [this.trace]);

  // Getter pour accéder au code de statut
  int get status => statusCode ?? 0;

  // Getter pour accéder au message d'erreur
  String get message => error!;

  @override
  String toString() =>
      'MusicSdkHttpError: $message, statusCode: $statusCode, trace: $trace';
}

final logger = Logger();

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor();

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode ?? 0;
    logger.e('MusicSdkHttpError statusCode: $statusCode');

    if (statusCode == 404) {
      logger.e("DioError: code 404: not found: ${err.requestOptions.uri}");
    } else if (err.response?.statusCode == 401) {
      // final refreshed = false;
      // if (refreshed) {
      //   err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
      //   final response = await _dio.fetch(err.requestOptions);
      //   return handler.resolve(response);
      // }
      logger.e("DioError: code 401: unauthenitcaed");
    } else if (err.response?.statusCode == 403) {
      logger.e("DioError: code 403: forbidden");
    } else if (err.response?.statusCode == 404) {
      logger.e("DioError: code 404: not found");
    } else if (err.response?.statusCode == 500) {
      logger.e("DioError: code 500: internal server error");
    } else if (err.response?.statusCode == 503) {
      logger.e("DioError: code 503: service unavailable");
    } else {
      logger.f(
          "DioError: code ${err.response?.statusCode}: unknown error, check your connectivity !");
    }
    return super.onError(err, handler);
  }
}

class RequestInterceptor extends Interceptor {
  final AuthLocalRepository _authLocalRepository =
      AuthLocalRepositoryImpl(IsarManager());

  RequestInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logger.i("Dio Request: ${options.method} ${options.path}");
    final token = await _authLocalRepository.getToken();
    if (token?.access != null) {
      options.headers['Authorization'] = 'Bearer ${token!.access}';
    }
    return handler.next(options);
  }
}

class ResponseInterceptor extends Interceptor {
  ResponseInterceptor();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i("Status Code: ${response.statusCode}");
    logger.i("Response Data: ${response.data}");
    return handler.next(response);
  }
}
