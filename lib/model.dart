import 'package:get/get.dart';

abstract class ModelBase extends GetxService{
  RxString userId = ''.obs; // 사용자 ID
  ModelBase({
    required this.userId,
  });
}

class Product extends ModelBase{
  Product({
    required super.userId,
    required this.itemId,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.bid,
    required this.images,
  });

  final String itemId;
  final String title; // 상품 제목
  final String description; // 상품 설명
  final String category; // 상품 카테고리
  final int price; // 즉시구매 가격
  final int bid; // 현재 입찰가
  final List<String> images; // 상품 이미지 URL 리스트
}

class User extends ModelBase{
  User({
    required super.userId,
    required this.password,
    required this.email,
    required this.username,
    required this.phonenumber,
    required this.points,
    required this.address,
    this.boughtProductIds = const [],
    this.postedProductIds = const [],
    this.sellProductIds = const [],
  });

  RxString username = ''.obs; // 사용자 이름
  RxString password = ''.obs;
  RxInt points = 0.obs;
  RxString email; // 사용자 이메일 주소
  RxString phonenumber; // 사용자 전화번호
  RxString address;
  final List<int> boughtProductIds; // 구매한 상품의 ID 리스트
  final List<int> postedProductIds; // 등록한 상품의 ID 리스트
  final List<int> sellProductIds; // 판매한 상품의 ID 리스트
}