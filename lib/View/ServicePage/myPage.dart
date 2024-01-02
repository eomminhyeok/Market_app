import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:study/model.dart';
import 'package:get/get.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    User user = Get.find<User>();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지'),
      ),
      body: Padding(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: screenWidth * 0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ' 마이페이지',
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
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '  회원 정보',
                  style: TextStyle(fontSize: screenWidth * 0.085),
                  textAlign: TextAlign.left, // 왼쪽 정렬
                ),
              ),
              Container(
                color: Color.fromARGB(255, 202, 202, 202),
                width: screenWidth * 0.9,
                height: 3.4 * (screenWidth * 0.1),
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.02,
                    screenHeight * 0.03,
                    screenWidth * 0.02,
                    screenHeight * 0.03),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft, // 좌측 정렬
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '회원 이름 : ${user.username}',
                          style: TextStyle(fontSize: 21),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 1,
                            child: Align(
                              alignment: Alignment.centerLeft, // 좌측 정렬
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '현재 마일리지 : ${user.points.value}P',
                                  style: TextStyle(fontSize: 30),
                                  textAlign: TextAlign.start, // 좌측 정렬
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: screenWidth * 0.16,
                            height: screenHeight * 0.04,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "chargingPage");
                              },
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '충전',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(80, 181, 181, 181))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Align(
                alignment: Alignment.centerLeft, // 좌측 정렬
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '  판매 & 구매 상황',
                    style: TextStyle(fontSize: screenWidth * 0.085),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                color: Color.fromARGB(255, 202, 202, 202),
                width: screenWidth * 0.9,
                height: screenHeight * 0.23,
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.02,
                    screenHeight * 0.02,
                    screenWidth * 0.02,
                    screenHeight * 0.02),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 1,
                            child: Align(
                              alignment: Alignment.centerLeft, // 좌측 정렬
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '판매중인 물건',
                                  style: TextStyle(fontSize: 30),
                                  textAlign: TextAlign.start, // 좌측 정렬
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: screenWidth * 0.16,
                            height: screenHeight * 0.04,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed('sellingList');
                              },
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '이동',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(80, 181, 181, 181))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 1,
                            child: Align(
                              alignment: Alignment.centerLeft, // 좌측 정렬
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '입찰중인 물건',
                                  style: TextStyle(fontSize: 30),
                                  textAlign: TextAlign.start, // 좌측 정렬
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: screenWidth * 0.16,
                            height: screenHeight * 0.04,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed('biddingList');
                              },
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '이동',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(80, 181, 181, 181))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 1,
                            child: Align(
                              alignment: Alignment.centerLeft, // 좌측 정렬
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '판매 내역',
                                  style: TextStyle(fontSize: 30),
                                  textAlign: TextAlign.start, // 좌측 정렬
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: screenWidth * 0.16,
                            height: screenHeight * 0.04,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed('soldListPage');
                              },
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '이동',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(80, 181, 181, 181))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 1,
                            child: Align(
                              alignment: Alignment.centerLeft, // 좌측 정렬
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '구매 내역',
                                  style: TextStyle(fontSize: 30),
                                  textAlign: TextAlign.start, // 좌측 정렬
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: screenWidth * 0.16,
                            height: screenHeight * 0.04,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed('buyingList');
                              },
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '이동',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(80, 181, 181, 181))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
