import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class Product extends GetxService {
  int itemId = 0; // 상품 등록번호
  RxString title = ''.obs; // 상품 제목
  RxString description = ''.obs; // 상품 설명
  RxInt price = 0.obs; // 즉시구매 가격
  RxInt bid = 0.obs; // 현재 입찰가
  String seller = ''; // 판매자
  RxString buyer = ''.obs;  // 구매자
  RxList<XFile?> images = <XFile?>[].obs; // 상품 이미지 리스트
  Rx<DateTime> createdTime = DateTime.now().obs;
  Rx<DateTime> expiryTime = DateTime.now().obs;
}

class Posts extends GetxService {
  RxList<Map<String, dynamic>> newPosts = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> searchPosts = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> buyingListPosts = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> soldListPosts = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> biddingListPosts = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> sellingListPosts = <Map<String, dynamic>>[].obs;
  RxMap<String, dynamic> postInfo = <String, dynamic>{}.obs;
  RxString lineUp = ''.obs;
  RxString keyword = ''.obs;
  RxInt min = 0.obs;
  RxInt max = 0.obs;
  RxInt limit = 0.obs;
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

class ColorController extends GetxController {
  Rx<Color> backColor = Color.fromARGB(255, 75, 74, 74).obs;
  Rx<Color> fontColor =Color.fromARGB(255, 240, 240, 240).obs;
  Rx<Color> buttonColor = Color.fromARGB(154, 255, 255, 255).obs;
  Rx<Color> grayfont = Color.fromARGB(154, 76, 71, 71).obs;
}

class LoadData extends GetxController {
  RxString sellerName = ''.obs;
  RxString buyerName = ''.obs;
}