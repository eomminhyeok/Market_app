import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:study/model.dart';
import 'package:get/get.dart';

class SignRepository {
  User user = Get.find<User>();

  SignRepository(); // 생성자

  static Future<void> signMethod(String name, String id, String pw,
      String email, String number, String address) async {
    final Dio _dio = Dio();

    try {
      final response = await _dio.post(
        'http://10.0.2.2:8000/userinfo/sign',
        data: {
          'userName': name,
          'userId': id,
          'password': pw,
          'email': email,
          'phoneNumber': number,
          'address': address,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      final responseData = response.data;
      final message = responseData['message'];

      if (response.statusCode == 200) {
        print('회원가입 성공: $message}');
        Get.toNamed('/mainPage');
      } else if (response.statusCode == 401) {
        print('회원가입 실패: $message');
      } else {
        print('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('네트워크 오류: $e');
    }
  }
}
