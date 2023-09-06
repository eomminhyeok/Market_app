import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:study/model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Dio _dio = Dio();

  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("로그인"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.12),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Market.',
                style: TextStyle(fontSize: screenWidth * 0.2, color: Colors.black),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    width: screenWidth * 0.1,
                    child: Text(
                      'ID',
                      style: TextStyle(
                        fontSize: screenWidth * 0.058,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.7,
                    child: TextField(
                      controller: userIdController,
                      decoration: InputDecoration(
                        hintText: '아이디를 입력하세요',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: screenWidth * 0.036),
                        fillColor: const Color.fromARGB(240, 255, 255, 255),
                        filled: true,
                      ),
                    ),

                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    width: screenWidth * 0.1,
                    child: Text(
                      'PW',
                      style: TextStyle(
                        fontSize: screenWidth * 0.055,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: '비밀번호를 입력하세요',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: screenWidth * 0.036),
                        fillColor: Color.fromARGB(240, 255, 255, 255),
                        filled: true,
                      ),
                      obscureText: true,
                    ),
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.7,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.04,
                  child: ElevatedButton(
                    onPressed: () async {
                      final userId = userIdController.text;
                      final password = passwordController.text;

                      try {
                        final response = await _dio.post(
                          'http://10.0.2.2:8000/userinfo/login',
                          data: {
                            'user_id': userId,
                            'password': password,
                          },
                          options: Options(
                            headers: {
                              'Content-Type': 'application/json',
                            },
                          ),
                        );

                        if (response.statusCode == 200) {
                          final responseData = response.data;
                          final message = responseData['message'];
                          print('로그인 성공: $message');
                          Navigator.pushNamed(context, 'mainPage');
                        } else if (response.statusCode == 401) {
                          final responseData = response.data;
                          final message = responseData['message'];
                          print('로그인 실패: $message');
                        } else {
                          print('서버 오류: ${response.statusCode}');
                        }
                      } catch (e) {
                        print('네트워크 오류: $e');
                      }
                    },
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '로그인',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          Size(screenWidth * 0.05, screenHeight * 0.04)),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(216, 176, 117, 1)),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.04,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "signPage");
                    },
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          Size(screenWidth * 0.05, screenHeight * 0.04)),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(216, 176, 117, 1)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}