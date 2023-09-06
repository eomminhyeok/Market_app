import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:study/View/ServicePage/mainPage.dart';

class SalesRegistration extends StatefulWidget {
  const SalesRegistration({super.key});

  @override
  State<SalesRegistration> createState() => _SalesRegistrationState();
}

String? selectedValue;

class _SalesRegistrationState extends State<SalesRegistration> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('판매등록'),
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
                  '  판매등록',
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
              SizedBox(height: screenHeight * 0.05),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.16,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '제목',
                          style: TextStyle(
                              fontSize: screenWidth * 15,
                              fontWeight: FontWeight.bold),
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
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      height: screenHeight * 0.04,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.26,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '즉시구매가',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.04,
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      height: screenHeight * 0.04,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.26,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '경매시작가',
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
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      height: screenHeight * 0.04,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                width: screenWidth * 0.9,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '글 내용',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Container(
                      child: TextField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          hintText: '\n\n\n\n\n\n\n\n\n',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      height: null,
                      width: screenWidth * 0.9,
                    ),
                    SizedBox(height: screenHeight * 0.03),
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
                                '이미지 등록',
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
                                hintText: '파일 첨부하기',
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
                                  '파일첨부',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
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
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.16,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '등록시간',
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
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
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                              color: Colors.white,
                            ),
                            child: DropdownButton<String>(
                              value: selectedValue,
                              items: [
                                DropdownMenuItem<String>(
                                  value: 'Option 1',
                                  child: Text('24h'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Option 2',
                                  child: Text('48h'),
                                ),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                            ),
                            height: screenHeight * 0.03,
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
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.2,
                    height: screenHeight * 0.05,
                    child: ElevatedButton(
                      onPressed: () => {},
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '판매등록',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 101, 175, 235)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
