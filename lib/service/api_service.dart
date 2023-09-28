import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchApiData() async {
    try {
      final response = await _dio.get('https://api.publicapis.org/entries');
      return response.data;
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }
}