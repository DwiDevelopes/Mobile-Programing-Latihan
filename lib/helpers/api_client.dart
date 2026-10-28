import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
    // baseUrl: 'https://6ad8110c95e98f36aef2e930.mockapi.io/api/v1/',
    baseUrl: 'http://10.136.24.64/api/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10)));

class ApiClient {
  Future<Response> get(String path) async {
    try {
      return await dio.get(Uri.encodeFull(path));
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      return await dio.post(Uri.encodeFull(path), data: data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      return await dio.put(Uri.encodeFull(path), data: data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await dio.delete(Uri.encodeFull(path));
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}