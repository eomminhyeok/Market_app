import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study/model.dart';
import 'package:intl/intl.dart';
import 'package:study/repository/posts_repository.dart';
import 'package:study/repository/login_repository.dart';
import 'dart:core';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  User user = Get.find<User>();
  Posts posts = Get.find<Posts>(); // 데이터모델에 RxList<Map<String, dynamic>> newPosts = <Map<String, dynamic>>[].obs; 선언하였음
  PostsRepository postsRepository = PostsRepository();
  LoginRepository updatePoints = LoginRepository();
  ColorController color = Get.find<ColorController>();
  GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
  final NumberFormat currencyFormat = NumberFormat.currency(locale: 'ko_KR', customPattern: '#,##0P');

  
  void initState() {
    super.initState();
    loadData(); // 페이지 초기 실행시 onRefresh 실행.(페이지 첫 로드시에도 게시글 목록을 표시하기위해)
  } 

  Future<void> loadData() async {
    // 데이터를 새로 불러와 갱신(10개까지)
    await postsRepository.postsMethod();
    
    if (mounted) {
      // ui 업데이트
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    String formatDate(DateTime date) {
      // 날짜표기 포맷
      final formatter = DateFormat('yyyy.MM.dd   HH:mm');
      return formatter.format(date);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Market'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color.backColor.value,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 4,
                      blurRadius: 15,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.fromLTRB(15, 27, 5, 20),
                width: screenWidth * 0.7,
                height: screenHeight * 0.14,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth * 1.0,
                        height: screenHeight * 0.1,
                        child: Text(
                          '${user.username}님 환영합니다.\n포인트: ${user.points.value}',
                          style: TextStyle(
                              fontSize: 23, color: color.fontColor.value),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth * 1.0,
                            child: Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.25,
                                  height: screenHeight * 0.05,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed('loginPage');
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '로그아웃',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                          Size(screenWidth * 0.05,
                                              screenHeight * 0.04)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              color.buttonColor.value),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.03),
                                Container(
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.05,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed('chargingPage');
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '충전',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                          Size(screenWidth * 0.05,
                                              screenHeight * 0.04)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              color.buttonColor.value),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.03),
                                Container(
                                  width: screenWidth * 0.27,
                                  height: screenHeight * 0.05,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed('myPage');
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '마이페이지',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                          Size(screenWidth * 0.05,
                                              screenHeight * 0.04)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              color.buttonColor.value),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.005,
              ),
              Column(
                children: [
                  Container(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('postRegistration');
                      },
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '판매하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(screenWidth * 0.05, screenHeight * 0.04)),
                        backgroundColor:
                            MaterialStateProperty.all(color.backColor.value),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.013,
                  ),
                  Container(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('searchPage');
                      },
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '구매하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(screenWidth * 0.05, screenHeight * 0.04)),
                        backgroundColor:
                            MaterialStateProperty.all(color.backColor.value),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
              thickness: 2,
              height: 1,
              color: Color.fromARGB(108, 164, 161, 161)),
              
                SizedBox(
                  width: screenWidth * 0.03,
                ),
          Expanded( // 상품 리스트
            child: RefreshIndicator(
              key: refreshKey, // RefreshIndicator의 key값 설정
              onRefresh: () async {
                // 새로고침시 loadData 실행 및 RefreshIndicator의 child 실행
                await loadData();
              },
              child: ListView.builder(
                itemCount: posts.newPosts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: InkWell(
                          onTap: () {
                            Map<String, dynamic> arguments = {
                              'post': posts.newPosts[index],
                              'index': index,
                              };
                            Get.toNamed('itemPage', arguments: arguments,);              
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.all(screenWidth * 0.03),
                            width: screenWidth * 1.0,
                            height: screenHeight * 0.18,
                            child: Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.38,
                                  height: screenHeight * 0.18,
                                  child: AspectRatio(
                                    aspectRatio: 1.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                          'http://10.0.2.2:8000/getImage?imagePath=${posts.newPosts[index]['images'][0]}',
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.fill), //posts의 이미지
                                    ),
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.52,
                                  height: screenHeight * 0.17,
                                  margin: EdgeInsets.all(screenWidth * 0.01),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: screenWidth * 0.5,
                                          child: Text(
                                            posts.newPosts[index]['title'], //posts의 title
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.01),
                  
                                        SizedBox(height: screenHeight * 0.01),
                                        Container(
                                          width: screenWidth * 0.5,
                                          child: Text(
                                            '게시일 : ${formatDate(posts.newPosts[index]['createdTime'])}', //posts의 createdTime
                                            style: TextStyle(fontSize: 12.5),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        Container(
                                          width: screenWidth * 0.5,
                                          child: Text(
                                            '마감 시간 : ${formatDate(posts.newPosts[index]['expiryTime'])}', //posts의 expiryTime
                                            style: TextStyle(
                                                fontSize: 12.5,
                                                color: Colors.red),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.01),
                                        Container(
                                          width: screenWidth * 0.5,
                                          child: Text(
                                            '즉시 구매가 : ${currencyFormat.format(posts.newPosts[index]['price'])}',
                                            style: TextStyle(fontSize: 15),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        Container(
                                          width: screenWidth * 0.5,
                                          child: Text(
                                            '현재 입찰가 : ${currencyFormat.format(posts.newPosts[index]['bid'])}',
                                            style: TextStyle(fontSize: 15),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                          thickness: 1,
                          height: screenHeight * 0.01,
                          color: Color.fromARGB(108, 164, 161, 161)),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
