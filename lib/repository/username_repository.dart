import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:study/model.dart';
import 'package:get/get.dart';

class UserNameRepository {
  User user = Get.find<User>();
  LoadData loadData = Get.find<LoadData>();

  UserNameRepository(); // 생성자

  Future<void> userNameInfo(String seller, String? buyer) async { 
    final Dio _dio = Dio();

    try {
      final response = await _dio.post(
        'http://10.0.2.2:8000/userinfo/searchName',
        data: {
          'seller': seller,
          'buyer': buyer,
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
        loadData.sellerName.value = responseData['sellerName']; 
        loadData.buyerName.value = responseData['buyerName'];
      } 
      else if (response.statusCode == 401) {
        print('포인트 정보 업데이트 실패: $message');
      } 
      else {
        print('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('네트워크 오류: $e');
    }
  }
}
