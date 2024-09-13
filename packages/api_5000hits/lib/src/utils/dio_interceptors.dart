import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:api_5000hits/src/features/user/auth_local_repository.dart';
import 'package:dio/dio.dart';
import '../features/user/impl/auth_local_repository_impl.dart';

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor();

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    print('DioHttpError: ${err.response?.statusCode}');
    if (err.response?.statusCode == 401) {
      // final refreshed = false;
      // if (refreshed) {
      //   err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
      //   final response = await _dio.fetch(err.requestOptions);
      //   return handler.resolve(response);
      // }
    }
    return super.onError(err, handler);
  }
}


class RequestInterceptor extends Interceptor {
  final AuthLocalRepository _authLocalRepository = AuthLocalRepositoryImpl(IsarManager());

  RequestInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print("Dio Request: ${options.method} ${options.path}");
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
    print("Response interceptor in action");
    print("Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");
    return handler.next(response);
  }
}