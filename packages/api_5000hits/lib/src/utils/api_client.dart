import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:api_5000hits/src/features/user/impl/auth_local_repository_impl.dart';
import 'package:api_5000hits/src/utils/dio_interceptors.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final _localRepository =AuthLocalRepositoryImpl(IsarManager());
  //static const String baseUrl = 'http://172.19.0.1:8002';
  // static const String baseUrl = 'http://172.28.112.1:8000';
   static const String baseUrl = 'https://api2.5000hits.com';
  late String? _token;
    late String? _apiKey;
  late Dio _dio;

  ApiClient()  {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
     configuredio();
     _initializeToken();
  }

  dynamic configuredio(){
    // _dio.interceptors.add(InterceptorsWrapper(
    //     onResponse: (Response response, ResponseInterceptorHandler handler) {
    //     print("response interceptor in action");

    //   return handler.next(response);
    // }));

    _dio.interceptors.add(RequestInterceptor());
    _dio.interceptors.add(ResponseInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
  }

  void setToken(String token) {
    _token = token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<void> _initializeToken() async {
    final token = await _localRepository.getToken();
    if (token?.access != null) {
      setToken(token!.access!);
    }
  }
  
  void setApiKey(String key) {
    _apiKey = key;
    _dio.options.headers['X-Api-Key'] = key;
  }

  void clearToken() {
    _token = null;
    _dio.options.headers.remove('Authorization');
  }
  
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken,
     void Function(int, int)? onReceiveProgress}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress, );
    } catch (error) {
      throw Exception('Failed to get data: $error');
    }
  }

  Future<Response> post(String path, dynamic data, {Options? options, CancelToken? cancelTokenn, CancelToken? cancelToken,
  void Function(int, int)? onSendProgress,
  void Function(int, int)? onReceiveProgress, }) async {
    try {
      return await _dio.post(path, data: data, options: options, cancelToken: cancelTokenn, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
    } catch (error) {
      throw Exception('Failed to post data: $error');
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      return await _dio.put(path, data: data);
    } catch (error) {
      throw Exception('Failed to put data: $error');
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await _dio.delete(path);
    } catch (error) {
      throw Exception('Failed to delete data: $error');
    }
  }
}
