import 'package:dio/dio.dart';
import 'package:study/model.dart';
import 'package:get/get.dart';

class ChargingRepository {
    User user = Get.find<User>();

  ChargingRepository(); // 생성자

Future<int> chargeMethod(String id, int addPoints) async {
  final Dio _dio = Dio();

  if (addPoints.isNaN || (addPoints <= 0)) {
    print("올바른 값을 입력해 주십시오.");
    return 500; // 예외 처리를 위해 500 반환 (실패)
  }

  int updatePoints = user.points.value + addPoints;

  try {
    final response = await _dio.post(
      'http://10.0.2.2:8000/points/charge',
      data: {
        'userId': id,
        'updatePoints': updatePoints,
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
      user.points.value = responseData['updatedPoints'];
      print('포인트 충전 : $message');
      return 200; // 성공
    } else if (response.statusCode == 400) {
      print('포인트 충전 : $message');
      return 400; // 실패
    } else if (response.statusCode == 500) {
      print('포인트 충전 : $message');
      return 500; // 실패
    } else {
      print('서버 오류: ${response.statusCode}');
      return 500; // 실패
    }
  } catch (e) {
    print('네트워크 오류: $e');
    return 500; // 실패
  }
}

}