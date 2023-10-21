import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:study/model.dart';
import 'package:get/get.dart';

class LoginRepository {
  User user = Get.put(User(
      userId: ''.obs,
      password: ''.obs,
      email: '',
      username: ''.obs,
      phonenumber: ''));

  LoginRepository(); // 생성자

  Future<void> loginMethod(String id, String pw) async {
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
        user.username.value = responseData['user_name'];
        print('로그인 성공: $message, 유저이름: ${user.username.value}');
        Get.toNamed('/mainPage');
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