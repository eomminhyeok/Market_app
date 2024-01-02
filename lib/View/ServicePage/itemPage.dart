import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // NumberFormat을 사용하기 위해 import
import 'package:study/repository/buying_repository.dart';
import 'package:study/model.dart';
import 'package:study/View/DialogView/buyingDialog.dart';
import 'package:study/View/DialogView/basicDailog.dart';
import 'package:study/repository/username_repository.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0; // 이미지 슬라이더 카운트
  User user = Get.find<User>();
  LoadData load = Get.find<LoadData>();
  UserNameRepository userName = UserNameRepository();
  final postInfo = Get.arguments['post'];
  final index = Get.arguments['index'];
  final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'ko_KR', customPattern: '#,##0P'); // 천단위로 구분 및 통화마크 P

  void initState() {
    super.initState();
    loadData(); // 페이지 초기 실행시 onRefresh 실행.(페이지 첫 로드시에도 게시글 목록을 표시하기위해)
  }

  Future<void> loadData() async {
    // 데이터를 새로 불러와 갱신
    await userName.userNameInfo(postInfo['seller'], null);
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String hideUserId(String userId) {
    // 아이디 가리기 함수
    if (userId.length <= 3) {
      // 길이가 3자리 이하인 경우
      return '*****'; // 글자수에 상관없이 5개의 *로 표현
    } else {
      // 길이가 3자리보다 큰 경우
      String maskedName = userId.substring(0, 3); // 앞의 3글자
      maskedName += '*' * (userId.length - 3); // 나머지 글자를 *로 표시
      return maskedName;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    userName.userNameInfo(postInfo['seller'], null); // 판매자의 아이디로 판매자의 이름 추출

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
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: FittedBox(
                      child: Container(
                        width: screenWidth * 0.35,
                        child: Align(
                          alignment: Alignment(-0.85, 0.0),
                          child: Text(
                            postInfo['title'],
                            style: TextStyle(
                                color: Colors.black),
                            softWrap: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FittedBox(
                      child: Text(
                        '게시일: \n${formatDate(postInfo['createdTime'])}',
                      ),
                    ),
                  ),
                ],
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
                        for (String image in postInfo['images'])
                          Image.network(
                            'http://10.0.2.2:8000/getImage?imagePath=${image}',
                            fit: BoxFit.contain,
                          ),
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
                          '${_currentPage + 1}/${postInfo['images'].length}',
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
              Row(
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      width: screenWidth * 0.5,
                      child: Text(
                        postInfo['title'],
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                        softWrap: true, // 텍스트가 화면 너비를 초과하면 자동으로 다음 줄로 넘어감
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.1,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      width: screenWidth * 0.3,
                      child: Text(
                        '판매자: ' +
                            load.sellerName.value +
                            '(' +
                            hideUserId(postInfo['seller']) +
                            ')',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        softWrap: true, // 텍스트가 화면 너비를 초과하면 자동으로 다음 줄로 넘어감
                      ),
                    ),
                  ),
                ],
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
                    postInfo['description'],
                    style: TextStyle(fontSize: 18),
                    softWrap: true,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.09),
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
                        '즉시구매가 :  ${currencyFormat.format(postInfo['price'])}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '현재입찰가 :  ${currencyFormat.format(postInfo['bid'])}',
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
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: screenWidth * 0.3,
                          height: screenHeight * 0.05,
                          child: ElevatedButton(
                            onPressed: () {
                              BuyingDialogClass.buying(
                                context,
                                () {
                                  if (user.points.value >= postInfo['price']) {
                                    BuyingRepository buying =
                                        BuyingRepository();
                                    buying.buyingMethod(
                                        postInfo['itemId'],
                                        postInfo['price'],
                                        postInfo['bidder'],
                                        postInfo['bid']);
                                    BasicDialogClass.basicDialog(
                                        context, '구매 성공', '상품구매에 성공하였습니다!');
                                    Get.toNamed('mainPage');
                                  } else if (user.points.value <
                                      postInfo['price']) {
                                    BuyingDialogClass.notEnoughMoney(
                                      context,
                                      () {
                                        Get.toNamed('chargingPage');
                                      },
                                      () {
                                        print('취소');
                                      },
                                    );
                                    print('포인트가 부족합니다.');
                                  }
                                  ;
                                },
                                () {
                                  print('취소');
                                },
                              );
                            },
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '즉시구매',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 131, 189, 236),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.1,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: screenWidth * 0.3,
                          height: screenHeight * 0.05,
                          child: ElevatedButton(
                            onPressed: () {
                              BuyingDialogClass biddingPro =
                                  BuyingDialogClass();
                              biddingPro.inputCost(context, () {
                                // 입찰가는 현재입찰가보다 높고, 즉시구매가보다는 낮아야한다.
                                if (biddingPro.bidCost > postInfo['bid'] &&
                                    biddingPro.bidCost < postInfo['price']) {
                                  // 입력값은 자신이 가진 포인트보다 높을 수 없다.
                                  if (user.points > biddingPro.bidCost) {
                                    biddingPro.bidding(
                                      context,
                                      () {
                                        if (user.points.value >=
                                            postInfo['bid']) {
                                          // 유저가 가지고 있는 포인트는 입찰가 이상이어야 한다.
                                          BuyingRepository buying =
                                              BuyingRepository();
                                          buying.biddingMethod(
                                              index,
                                              postInfo['itemId'],
                                              postInfo['bid'],
                                              biddingPro.bidCost,
                                              postInfo['bidder']);
                                          BasicDialogClass.basicDialog(context,
                                              '입찰 성공', '상품입찰에 성공하였습니다!');
                                          Get.toNamed('mainPage');
                                        }
                                      },
                                      () {
                                        print('취소');
                                      },
                                    );
                                  } else {
                                    BuyingDialogClass.notEnoughMoney(
                                      context,
                                      () {
                                        Get.toNamed('chargingPage');
                                      },
                                      () {
                                        print('취소');
                                      },
                                    );
                                    print('포인트가 부족합니다.');
                                  }
                                } else {
                                  BasicDialogClass.basicDialog(context, '입력 오류',
                                      '입찰가는 현재 입찰가보다 높고 즉시구매가보다 낮아야 합니다');
                                }
                              }, () {
                                print('취소');
                              });
                            },
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '입찰',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 125, 212, 128),
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
