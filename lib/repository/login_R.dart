import 'package:dio/dio.dart';

class LoginRepository {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> login(String userId, String password) async {
    try {
      final response = await _dio.post(
        'http://10.0.2.2:8000/userinfo/login',
        data: {
          'user_id': userId,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      return response.data;
    } catch (e) {
      throw e;
    }
  }
}