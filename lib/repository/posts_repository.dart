import 'package:dio/dio.dart';
import 'package:study/model.dart';
import 'package:get/get.dart';

class PostsRepository {
  Posts posts = Get.find<Posts>();

  PostsRepository(); // 생성자

  Future<void> postsMethod() async {
    final Dio _dio = Dio();
    try {
      final response = await _dio.get(
        'http://10.0.2.2:8000/posts/newPosts',
      );

      if (response.statusCode == 200) {
        print('게시글 목록 불러오기 성공!');
        posts.newPosts.assignAll(
          List<Map<String, dynamic>>.from(response.data['posts']).map((postData) {
            // 출력 추가
            print('Processing postData: $postData');

            // 필드에 맞게 데이터 변환
            return {
              'itemId': postData['item_id'] as int,
              'title': (postData['title'] ?? '').toString(),
              'description': (postData['description'] ?? '').toString(),
              'price': (postData['price'] ?? 0) is int? (postData['price'] ?? 0): 0,
              'bid': (postData['bid'] ?? 0) is int ? (postData['bid'] ?? 0) : 0,
              'seller': (postData['seller'] ?? '').toString(),
              'buyer': (postData['buyer'] ?? '').toString(),
              'images': (postData['images'] as List<dynamic>).map((imagePath) => imagePath.toString()).toList(),
              'createdTime': DateTime.parse(postData['createdTime'] ?? ''),
              'expiryTime': DateTime.parse(postData['expiryTime'] ?? ''),
            };
          }).toList(),
        );
        print('Posts: ${posts.newPosts}');
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
