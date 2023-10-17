import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginRepository {
  LoginRepository(); // 생성자

  Future<void> loginMethod(String id, String pw, String username, BuildContext context) async {
    final Dio _dio = Dio();

    try {
      final response = await _dio.post(
        'http://10.0.2.2:8000/userinfo/login',
        data: {
          'user_id': id,
          'password': pw,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        final message = responseData['message'];
        print('로그인 성공: $message');
        username = responseData["username"];
        Navigator.pushNamed(context, 'mainPage');
      } else if (response.statusCode == 401) {
        final responseData = response.data;
        final message = responseData['message'];
        print('로그인 실패: $message');
      } else {
        print('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('네트워크 오류: $e');
    }
  }
}