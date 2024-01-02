import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:study/repository/myPage/soldList_repository.dart';
import 'package:study/model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:core';

class SoldListPage extends StatefulWidget {
  const SoldListPage({super.key});

  @override
  State<SoldListPage> createState() => _SoldListPageState();
}

class _SoldListPageState extends State<SoldListPage> {
  @override
  Posts posts = Get.find<Posts>();
    GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'ko_KR', customPattern: '#,##0P');
    SoldListRepository soldListRepository = SoldListRepository();
    ColorController color = Get.find<ColorController>();

    
    @override
    void initState() {
      super.initState();
      loadData(); // 페이지 초기 실행시 onRefresh 실행.(페이지 첫 로드시에도 게시글 목록을 표시하기위해)
    }

    Future<void> loadData() async {
    // 데이터를 새로 불러와 갱신(10개까지)
    await soldListRepository.soldListMethod(); // 판매내역 로드 함수
    print('판매내역 불러오기');
    if (mounted) {
      // ui 업데이트
      setState(() {});
    }
  }

    String formatDate(DateTime date) {
      // 날짜표기 포맷
      final formatter = DateFormat('yyyy.MM.dd   HH:mm');
      return formatter.format(date);
    }

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('판매 내역'),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: screenWidth * 0.02, vertical: screenHeight * 0.03),
        child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ' 판매 내역',
                  style: TextStyle(
                      fontSize: screenWidth * 0.09, color: Colors.black),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Divider(
                thickness: 2,
                height: 1,
                color: Color.fromARGB(108, 164, 161, 161),
              ),
              SizedBox(height: screenHeight * 0.01),
              Expanded( // 상품 리스트
            child: RefreshIndicator(
              key: refreshKey, // RefreshIndicator의 key값 설정
              onRefresh: () async {
                // 새로고침시 loadData 실행 및 RefreshIndicator의 child 실행
                await loadData();
              },
              child: ListView.builder(
                itemCount: posts.soldListPosts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: InkWell(
                          onTap: () {
                            Map<String, dynamic> arguments = {
                              'post': posts.soldListPosts[index],
                              'index': index,
                              };
                            Get.toNamed('finishItemPage', arguments: arguments,);              
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
                                          'http://10.0.2.2:8000/getImage?imagePath=${posts.soldListPosts[index]['images'][0]}',
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
                                            posts.soldListPosts[index]['title'], //posts의 title
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.04),
                                        Container(
                                          width: screenWidth * 0.5,
                                          child: Text(
                                            '판매 일자 : ${formatDate(posts.soldListPosts[index]['expiryTime'])}', //posts의 expiryTime
                                            style: TextStyle(
                                                fontSize: 12.5,
                                                color: Color.fromARGB(255, 72, 9, 120)),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.01),
                                        Container(
                                          width: screenWidth * 0.5,
                                          child: Text(
                                            '최종 거래가 : ${currencyFormat.format(posts.soldListPosts[index]['price'])}',
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
      ),
    );
  }
}