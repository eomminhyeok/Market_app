import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:study/View/Login/loginPage.dart';

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '회원가입',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.008),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '   회원가입',
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
                  SizedBox(height: screenHeight * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: screenHeight * 0.04,
                          width: screenWidth * 0.16,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '아이디',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      Flexible(
                        flex: 3,
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
                              hintText: '아이디를 입력해주세요',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth * 0.03),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                          height: screenHeight * 0.04,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.04,
                          child: ElevatedButton(
                            onPressed: () => {},
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '중복체크',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.045),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: screenHeight * 0.04,
                          width: screenWidth * 0.16,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '비밀번호',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      Flexible(
                        flex: 3,
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
                              hintText: '비밀번호를 입력해주세요',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth * 0.03),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            obscureText: true,
                          ),
                          height: screenHeight * 0.04,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.04,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.045),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: screenHeight * 0.04,
                          width: screenWidth * 0.16,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'e-mail',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      Flexible(
                        flex: 3,
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
                              hintText: '이메일을 입력해주세요',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth * 0.03),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                          height: screenHeight * 0.04,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.04,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.045),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: screenHeight * 0.04,
                          width: screenWidth * 0.16,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '전화번호',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      Flexible(
                        flex: 3,
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
                              hintText: '전화번호를 입력해주세요(\' - \'제외)',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth * 0.03),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                          height: screenHeight * 0.04,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.04,
                          child: ElevatedButton(
                            onPressed: () => {},
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '인증하기',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.045),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: screenHeight * 0.04,
                          width: screenWidth * 0.16,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '주소',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      Flexible(
                        flex: 3,
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
                              hintText: '주소를 입력해주세요',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth * 0.03),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                          height: screenHeight * 0.04,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.04,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  ElevatedButton(
                    onPressed: () => {},
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '가입하기',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          Size(screenWidth * 0.05, screenHeight * 0.05)),
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(179, 255, 193, 7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
