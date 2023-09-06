import 'dart:ui';
import 'package:flutter/material.dart';

class BuyingList extends StatefulWidget {
  const BuyingList({super.key});

  @override
  State<BuyingList> createState() => _BuyingListState();
}

class _BuyingListState extends State<BuyingList> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('구매 내역'),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: screenWidth * 0.02, vertical: screenHeight * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ' 구매 내역',
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
                                Image.asset('assets/p1.gif', fit: BoxFit.fill),
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
                                SizedBox(height: screenHeight * 0.05),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '구매 일자 : 2023.05.18',
                                    style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 54, 129, 56)),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '구매가 : 230,000P',
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
      ),
    );
  }
}