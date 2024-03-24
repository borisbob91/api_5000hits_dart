import 'dart:convert';
import 'package:dio/dio.dart';

class ApiClient {
  static const String baseUrl = 'http://172.19.0.1:8002';
  late Dio _dio;

  ApiClient()  {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
     configuredio();
  }

  dynamic configuredio(){
    _dio.interceptors.add(InterceptorsWrapper(
        onResponse: (Response response, ResponseInterceptorHandler handler) {
      print("response interceptor in action");

      return handler.next(response);
    }));
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } catch (error) {
      throw Exception('Failed to get data: $error');
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      return await _dio.post(path, data: data);
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
