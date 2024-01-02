import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:study/model.dart';
import 'package:get/get.dart';

class LoginRepository {
  User user = Get.find<User>();

  LoginRepository(); // 생성자

  Future<void> loginMethod(String id, String pw) async {
    final Dio _dio = Dio();

    try {
      final response = await _dio.post(
        'http://10.0.2.2:8000/userinfo/login',
        data: {
          'userId': id,
          'password': pw,
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
        user.username = responseData['user_name'];
        user.points.value = responseData['points'];
        print('로그인 성공: $message, 유저이름: ${user.username}, 포인트: ${user.points.value}');
        Get.toNamed('/mainPage');
      } 
      else if (response.statusCode == 401) {
        print('로그인 실패: $message');
      } 
      else {
        print('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('네트워크 오류: $e');
    }
  }
}
