import 'package:dio/dio.dart' as dio;
import 'package:study/model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class RegistrationRepository {
    Product product = Get.find<Product>();
    User user = Get.find<User>();
    Posts posts = Get.find<Posts>();

  RegistrationRepository(); // 생성자

Future<void> registrationMethod(String title, String description, int price,
  int bid, List<XFile> images, DateTime createdTime, DateTime expiryTime) async {
    final dio.Dio _dio = dio.Dio();
    
    try {
      dio.FormData formData = dio.FormData.fromMap({
        'title': title,
        'description': description,
        'price': price,
        'bid': bid,
        'seller': user.userId,
        'createdTime': createdTime,
        'expiryTime': expiryTime,
        'images': images.map((image) => dio.MultipartFile.fromFileSync(image.path)).toList(),
      });

      final response = await _dio.post(
        'http://10.0.2.2:8000/product/create',
        data: formData,
      );

      if (response.statusCode == 200) {
        print('게시글 등록 완료!');
      }else if (response.statusCode == 500) {
        print('게시글 등록 실패');
      } else {
        print('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('네트워크 오류: $e');
    }
  }
}