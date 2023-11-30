import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Product extends GetxService {
  int itemId = 0; // 상품 등록번호
  RxString title = ''.obs; // 상품 제목
  RxString description = ''.obs; // 상품 설명
  RxInt price = 0.obs; // 즉시구매 가격
  RxInt bid = 0.obs; // 현재 입찰가
  String seller = ''; // 판매자
  String buyer = '';  // 구매자
  RxList<XFile?> images = <XFile?>[].obs; // 상품 이미지 리스트
  Rx<DateTime> createdTime = DateTime.now().obs;
  Rx<DateTime> expiryTime = DateTime.now().obs;
}

class Posts extends GetxService {
  RxList<Map<String, dynamic>> newPosts = <Map<String, dynamic>>[].obs;
}

class User extends GetxService {
  String userId = '';
  String username = ''; // 사용자 이름
  String password = '';
  RxInt points = 0.obs;
  String email = ''; // 사용자 이메일 주소
  String phonenumber = ''; // 사용자 전화번호
  String address = '';
}
