import 'package:dio/dio.dart';
import 'package:study/model.dart';
import 'package:get/get.dart';


class ImageRepository {
  Posts posts = Get.find<Posts>();

  ImageRepository(); // 생성자

Future<void> imageMethod(String requestUrl) async {
    final Dio _dio = Dio();
    
    try {
      final response = await _dio.get(
        'http://10.0.2.2:8000/posts/images',
        data: {
          'requestUrl': requestUrl,
        },
        options: Options(
          headers: {
           'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('url 전송 완료');
      }else if (response.statusCode == 500) {
        print('url 전송 실패');
      } else {
        print('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('네트워크 오류: $e');
    }
  }
}