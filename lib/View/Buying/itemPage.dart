import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:study/View/ServicePage/mainPage.dart';
import 'package:study/View/Buying/itemPage.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('상품정보'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '  상품 상세',
                  style: TextStyle(
                      fontSize: screenWidth * 0.09, color: Colors.black),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Divider(
                thickness: 2,
                height: 1,
                color: Color.fromARGB(108, 164, 161, 161),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.38,
                child: Stack(
                  children: [
                    PageView(
                      controller: _pageController,
                      children: [
                        Image.asset('assets/p1.gif'),
                        Image.asset('assets/p2.jpeg'),
                        Image.asset('assets/p1.gif'),
                      ],
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          '${_currentPage + 1}/${3}',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Divider(
                thickness: 2,
                height: 1,
                color: Color.fromARGB(108, 164, 161, 161),
              ),
              SizedBox(height: screenHeight * 0.01),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  width: screenWidth * 0.9,
                  child: Text(
                    '에비츄 급처합니다',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Divider(
                thickness: 2,
                height: 1,
                color: Color.fromARGB(108, 164, 161, 161),
              ),
              SizedBox(height: screenHeight * 0.01),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  width: screenWidth * 0.9,
                  height: null,
                  child: Text(
                    "동글동글 예쁜 에비츄 반짝반짝 빨간 구슬~\n에비츄 팝니다\n한마리도아니고 두마리도아니고 사실 한마리\n에비츄 팝니다\n에비츄 짱귀여움!",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Divider(
                thickness: 2,
                height: 1,
                color: Color.fromARGB(108, 164, 161, 161),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  color: Color.fromARGB(255, 235, 235, 235),
                  width: screenWidth * 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '   즉시구매가: 260,000P',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '   현재입찰가: 230,000P',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  color: Color.fromARGB(255, 235, 235, 235),
                  width: screenWidth * 1,
                  height: screenHeight * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(flex: 1, child: 
                      Container(
                        width: screenWidth * 0.3,
                        height: screenHeight * 0.05,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '즉시구매',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 131, 189, 236),
                          ),
                        ),
                      ),
                      ),
                      SizedBox(width: screenWidth * 0.1,),
                      Flexible(flex: 1, child: 
                      Container(
                        width: screenWidth * 0.3,
                        height: screenHeight * 0.05,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '입찰',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 125, 212, 128),
                          ),
                        ),
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
    );
  }
}
