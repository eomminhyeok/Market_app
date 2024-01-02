import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:study/model.dart';
import 'package:get/get.dart';

class BuyingRepository {
  User user = Get.find<User>();
  Posts posts = Get.find<Posts>();

  BuyingRepository(); // 생성자

  // 즉시구매 버튼 클릭시 buyingMethod 호출
  Future<void> buyingMethod(int itemId, int price, String? currentBidder, int bid) async {
    final Dio _dio = Dio();
    DateTime currentTime = DateTime.now();

    try {
      final response = await _dio.post(
        'http://10.0.2.2:8000/posts/buying',
        data: {
          'itemId': itemId,
          'userId': user.userId,
          'deductPoints': user.points.value - price,
          'currentBidder': currentBidder,
          'price': price,
          'bid': bid,
          'time': currentTime.toIso8601String(),
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      final responseData = response.data;

      if (response.statusCode == 200) {
        user.points.value = responseData['updatedPoints'];
        print(responseData['updatedPoints']);
        print(responseData['message']);
        
      } else if (response.statusCode == 500) {
        print('구매 실패');
      } else {
        print('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('네트워크 오류: $e');
    }
  }


  // 상품 입찰시 biddingMethod 호출
  Future<void> biddingMethod(int index,int itemId, int bid, int newBid, String? bidder) async {
    final Dio _dio = Dio();

    try {
      final response = await _dio.post(
        'http://10.0.2.2:8000/posts/bidding',
        data: {
          'itemId': itemId,
          'userId': user.userId, // 새로운 입찰자
          'bid': bid, // 현재 입찰금(기존 입찰자에게 반환)
          'deductPoints': user.points.value - newBid, // 입찰자의 포인트에서 입찰가 차감
          'currentBidder': bidder, // 현재 입찰자
          'newBid': newBid,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      final responseData = response.data;

      if (response.statusCode == 200) {
        user.points.value = responseData['updatedPoints'];
        
        posts.newPosts[index]['bid'] = responseData['updatedBid'];
        print(responseData['message']);
        print(user.points.value); 
        print(posts.newPosts[index]['bid']);
      } else if (response.statusCode == 500) {
        print('입찰 실패');
      } else {
        print('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('네트워크 오류: $e');
    }
  }
}
