import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:api_5000hits/src/features/auth/impl/auth_local_repository_impl.dart';
import 'package:api_5000hits/src/utils/dio_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  final Map<String, CancelToken> _cancelTokens = {};
  final _localRepository = AuthLocalRepositoryImpl(IsarManager());
  static const String baseUrl = 'https://api2.5000hits.com';
  String? _token;
  String? _apiKey;
  late Dio _dio;

  ApiClient._internal() {
    _dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 60)));
    _configureDio();
    _initializeToken();
  }

  void _configureDio() {
    _dio.interceptors.add(RequestInterceptor());
    _dio.interceptors.add(ResponseInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
  }

  Future<void> _initializeToken() async {
    final token = await _localRepository.getToken();
    if (token?.access != null) {
      setToken(token!.access!);
    }
  }

  void setToken(String token) {
    _token = token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void setApiKey(String key) {
    print('setting api key');
    if (_apiKey == null) {
      _apiKey = key;
      _dio.options.headers['X-Api-Key'] = key;
    }
  }

  void clearToken() {
    _token = null;
    _dio.options.headers.remove('Authorization');
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onReceiveProgress}) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (error) {
      throw DioHttpError(
        error.message!,
        error.response?.statusCode,
        error.stackTrace.toString(),
      );
    } catch (error, stackTrace) {
      logger.f('Fatal error: $error');
      logger.f('Stacktrace: $stackTrace');
      throw Exception('Fatal error in get  method error: $error trace: $stackTrace');
    }
  }

  Future<Response> post(
    String path,
    dynamic data, {
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    }on DioException catch (error) {
      throw DioHttpError(
        error.message!,
        error.response?.statusCode,
        error.stackTrace.toString(),
      );
    } catch (error) {
      throw Exception('Failed to post data: $error');
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      return await _dio.put(path, data: data);
    }on DioException catch (error) {
      throw DioHttpError(
        error.message!,
        error.response?.statusCode,
        error.stackTrace.toString(),
      );
    } catch (error) {
      throw Exception('Failed to put data: $error');
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await _dio.delete(path);
    }on DioException catch (error) {
      throw DioHttpError(
        error.message!,
        error.response?.statusCode,
        error.stackTrace.toString(),
      );
    } catch (error) {
      throw Exception('Failed to delete data: $error');
    }
  }

  Future<Response> download(
      String path, String savePath, Function(int, int) onProgress) async {
    final cancelToken = CancelToken();
    _cancelTokens[path] = cancelToken;
    try {
      return await _dio.download(
        path,
        savePath,
        cancelToken: cancelToken,
        onReceiveProgress: onProgress,
      );
    }on DioException catch (error) {
      throw DioHttpError(
        error.message!,
        error.response?.statusCode,
        error.stackTrace.toString(),
      );
    } catch (error, stackTrace) {
     throw  DioHttpError(
      error.toString(),
      0,
      stackTrace.toString(),
    );
      // throw Exception('Failed to download data: $error');
    } finally {
      _cancelTokens.remove(path);
    }
  }
}
