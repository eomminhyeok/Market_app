import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:study/model.dart';
import 'package:get/get.dart';

class BuyingListRepository {
  User user = Get.find<User>();
  Posts posts = Get.find<Posts>();

  BuyingListRepository(); // 생성자

  Future<void> buyingListMethod() async {
    final Dio _dio = Dio();

    try {
      final response = await _dio.post(
        'http://10.0.2.2:8000/myPage/buyingList',
        data: {
          'userId': user.userId,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('게시글 목록 불러오기 성공!');
        posts.buyingListPosts.assignAll(
          List<Map<String, dynamic>>.from(response.data['posts']).map((postData) {
            // 필드에 맞게 데이터 변환
            return {
              'itemId': postData['itemId'] as int,
              'title': (postData['title'] ?? '').toString(),
              'description': (postData['description'] ?? '').toString(),
              'price': (postData['price'] ?? 0) is int? (postData['price'] ?? 0): 0,
              'bid': (postData['bid'] ?? 0) is int ? (postData['bid'] ?? 0) : 0,
              'seller': (postData['seller'] ?? '').toString(),
              'buyer': (postData['buyer'] ?? '').toString(),
              'bidder': (postData['bidder'] ?? '').toString(),
              'images': (postData['images'] as List<dynamic>).map((imagePath) => imagePath.toString()).toList(),
              'createdTime': DateTime.parse(postData['createdTime'] ?? ''),
              'expiryTime': DateTime.parse(postData['expiryTime'] ?? ''),
            };
          }).toList(),
        );
      } else if (response.statusCode == 500) {
        print('게시글 목록 불러오기 실패..');
      } else {
        print('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('네트워크 오류: $e');
    }
  }
}