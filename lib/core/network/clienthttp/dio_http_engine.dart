// lib/core/network/clienthttp/dio_http_engine.dart

import 'package:dio/dio.dart';
import '../dio_client.dart';
import 'http_engine.dart';

class DioHttpEngine implements HttpEngine {
  final DioClient dioClient;

  DioHttpEngine(this.dioClient);

  Dio get _dio => dioClient.dio;

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    final response = await _dio.get(path, queryParameters: query);

    return Map<String, dynamic>.from(response.data);
  }

  @override
  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    final response = await _dio.post(path, data: body);

    return Map<String, dynamic>.from(response.data);
  }
}
