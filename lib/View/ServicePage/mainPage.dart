import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:study/model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  User user = Get.put(User(
      userId: ''.obs,
      password: ''.obs,
      email: '',
      username: ''.obs,
      phonenumber: ''));

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Market'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(159, 245, 228, 181),
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
                            '${user.username.value}님 환영합니다.\n현재포인트: 20000P',
                            style: TextStyle(fontSize: 23),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
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
                                        Navigator.pushNamed(
                                            context, "loginPage");
                                      },
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          '로그아웃',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(131, 184, 176, 176),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.03),
                                  Container(
                                    width: screenWidth * 0.2,
                                    height: screenHeight * 0.05,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "chargingPage");
                                      },
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          '충전',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(
                                              131, 184, 176, 176)),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.03),
                                  Container(
                                    width: screenWidth * 0.27,
                                    height: screenHeight * 0.05,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, "myPage");
                                      },
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          '마이페이지',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(
                                              131, 184, 176, 176)),
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
                          Navigator.pushNamed(context, "S_Registration");
                        },
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '판매하기',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 131, 189, 236)),
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
                          Navigator.pushNamed(context, "searchPage");
                        },
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '구매하기',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 125, 212, 128),
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
              height: screenHeight * 0.02,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      width: screenWidth * 0.45,
                      height: screenHeight * 0.040,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('검색',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          Size(screenWidth * 0.05, screenHeight * 0.04)),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(131, 184, 176, 176)),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                ],
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "ItemPage");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 226, 139),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 4,
                        blurRadius: 15,
                        offset: Offset(0, 3),
                      ),
                    ],
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
                          child: Image.asset('assets/p1.gif', fit: BoxFit.fill),
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
                                  '에비츄 급처합니다',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Container(
                                width: screenWidth * 0.5,
                                child: Text(
                                  '게시일 : 2023.05.16',
                                  style: TextStyle(fontSize: 12.5),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                width: screenWidth * 0.5,
                                child: Text(
                                  '남은 시간 : 14h 32m',
                                  style: TextStyle(
                                      fontSize: 12.5, color: Colors.red),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Container(
                                width: screenWidth * 0.5,
                                child: Text(
                                  '즉시 구매가 : 260,000P',
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                width: screenWidth * 0.5,
                                child: Text(
                                  '현재 입찰가 : 230,000P',
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
            FittedBox(
              fit: BoxFit.scaleDown,
              child: InkWell(
                onTap: () => {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 226, 139),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 4,
                        blurRadius: 15,
                        offset: Offset(0, 3),
                      ),
                    ],
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
                          child:
                              Image.asset('assets/p2.jpeg', fit: BoxFit.fill),
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
                                  '햄스터 팔아요~~',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Container(
                                width: screenWidth * 0.5,
                                child: Text(
                                  '게시일 : 2023.05.16',
                                  style: TextStyle(fontSize: 12.5),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                width: screenWidth * 0.5,
                                child: Text(
                                  '남은 시간 : 14h 32m',
                                  style: TextStyle(
                                      fontSize: 12.5, color: Colors.red),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Container(
                                width: screenWidth * 0.5,
                                child: Text(
                                  '즉시 구매가 : 260,000P',
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                width: screenWidth * 0.5,
                                child: Text(
                                  '현재 입찰가 : 230,000P',
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
            FittedBox(
              fit: BoxFit.scaleDown,
              child: InkWell(
                onTap: () => {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 226, 139),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 4,
                        blurRadius: 15,
                        offset: Offset(0, 3),
                      ),
                    ],
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
                          child: Image.asset('assets/p1.gif', fit: BoxFit.fill),
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
                                  '동글동글 팜팜',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Container(
                                width: screenWidth * 0.5,
                                child: Text(
                                  '게시일 : 2023.05.16',
                                  style: TextStyle(fontSize: 12.5),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                width: screenWidth * 0.5,
                                child: Text(
                                  '남은 시간 : 14h 32m',
                                  style: TextStyle(
                                      fontSize: 12.5, color: Colors.red),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Container(
                                width: screenWidth * 0.5,
                                child: Text(
                                  '즉시 구매가 : 260,000P',
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                width: screenWidth * 0.5,
                                child: Text(
                                  '현재 입찰가 : 230,000P',
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
          ],
        ),
      ),
    );
  }
}
