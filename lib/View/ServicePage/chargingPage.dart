import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:study/View/ServicePage/mainPage.dart';
import 'package:study/main.dart';

class ChargingPage extends StatefulWidget {
  const ChargingPage({super.key});

  @override
  State<ChargingPage> createState() => _ChargingPageState();
}

class _ChargingPageState extends State<ChargingPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
       appBar: AppBar(
        title: const Text('마일리지 충전'),
      ),
      body: 
      SingleChildScrollView(
        child: 
        Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              // ignore: prefer_const_constructors
              child: Padding(
                padding: EdgeInsets.only(top: screenWidth * 0.02),
                // ignore: prefer_const_constructors
                child: Text(
                  '  마일리지 충전',
                style: TextStyle(fontSize: screenWidth * 0.09, color: Colors.black),
                ),           
              ),
              ),
              SizedBox(height: screenHeight * 0.01,),
              
              Divider(thickness: 2, height: 1, color: Color.fromARGB(108, 164, 161, 161)),

              SizedBox(height: screenHeight * 0.01,),
            FittedBox(
              fit: BoxFit.scaleDown,
              child:
              Container(
                width: screenWidth * 0.95, height: screenHeight * 0.77,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color : Color.fromARGB(255, 239, 215, 144),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 4,
                      blurRadius: 15,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                
                child: 
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children : [
                      SizedBox(height: screenHeight * 0.2,),
                      Flexible(flex : 1, 
                              child: 
                              Container(
                              width: screenWidth * 0.2,
                              child :
                              Text('충전금액', style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                          ),
                          ),
                        ),
                      Flexible(flex: 3, child: Container(
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
                        child: TextField(decoration: InputDecoration(
                          hintText: '충전할 금액을 입력하세요',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: screenWidth * 0.03),
                          fillColor : Color.fromARGB(240, 255, 255, 255),
                          filled: true,
                          ), 
                        ),height: screenHeight * 0.04,
                      ),
                      ),
                      SizedBox(width: screenWidth * 0.02,),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: screenHeight * 0.04, width: screenWidth * 0.15,
                          child: ElevatedButton(
                            onPressed: () => {},
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child:
                            Text('충전', style: TextStyle(fontSize: 15),
                            ),
                            ),
                            ),
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}