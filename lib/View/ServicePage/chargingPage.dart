import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:study/model.dart';
import 'package:get/get.dart';
import 'package:study/repository/charging_repository.dart';
import 'package:study/View/DialogView/normalDailog.dart';

class ChargingPage extends StatefulWidget {
  const ChargingPage({super.key});

  @override
  State<ChargingPage> createState() => _ChargingPageState();
}

class _ChargingPageState extends State<ChargingPage> {
  TextEditingController pointsController = TextEditingController();

  User user = Get.find<User>();
  ColorController color = Get.find<ColorController>();
  NormalDialog normalDialog = NormalDialog();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('마일리지 충전'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              // ignore: prefer_const_constructors
              child: Padding(
                padding: EdgeInsets.only(top: screenWidth * 0.02),
                // ignore: prefer_const_constructors
                child: Text(
                  '  마일리지 충전',
                  style: TextStyle(
                      fontSize: screenWidth * 0.09, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Divider(
                thickness: 2,
                height: 1,
                color: Color.fromARGB(108, 164, 161, 161)),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                width: screenWidth * 0.95,
                height: screenHeight * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 176, 175, 173),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 4,
                      blurRadius: 15,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.2,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: screenWidth * 0.2,
                            child: Text(
                              '충전금액',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
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
                              controller: pointsController,
                              decoration: InputDecoration(
                                hintText: '충전할 금액을 입력하세요',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: screenWidth * 0.03),
                                fillColor: Color.fromARGB(240, 255, 255, 255),
                                filled: true,
                              ),
                            ),
                            height: screenHeight * 0.04,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.2,
                            child: ElevatedButton(
                              onPressed: () async {
                                // 포인트 충전 여부 확인 다이얼로그
                                var confirm = await NormalDialog.confirmDialog(
                                  context,
                                  '포인트 충전',
                                  '${pointsController.text}P를 충전하시겠습니까?',
                                );

                                if (confirm == true) {
                                  // "네"를 선택한 경우
                                  ChargingRepository charge =
                                      ChargingRepository();
                                  int addPoints =
                                      int.parse(pointsController.text);

                                  try {
                                    var res = await charge.chargeMethod(
                                        user.userId, addPoints);

                                    if (res == 200) {
                                      // 성공 다이얼로그 표시
                                      NormalDialog.successDialog(
                                        context,
                                        '충전 완료',
                                        '포인트가 성공적으로 충전되었습니다.',
                                      );
                                      pointsController.clear(); // 텍스트 필드 비우기
                                    } else {
                                      // 실패 다이얼로그 표시
                                      NormalDialog.failureDialog(
                                        context,
                                        '충전 실패',
                                        '포인트 충전에 실패하였습니다.',
                                      );
                                    }
                                  } catch (error) {
                                    // 예외 처리 (예외 발생 시)
                                    print('Error charging points: $error');
                                    NormalDialog.errorDialog(
                                      context,
                                      '에러',
                                      '포인트 충전 중 오류가 발생했습니다.',
                                    );
                                  }
                                } else {
                                  // "아니오"를 선택한 경우 또는 다이얼로그를 닫은 경우
                                  print('포인트 충전을 취소하였습니다.');
                                }
                              },
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Text(
                                  '충전',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.fontColor.value),
                                ),
                              ),
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(Size(
                                    screenWidth * 0.05, screenHeight * 0.04)),
                                backgroundColor: MaterialStateProperty.all(
                                    color.backColor.value),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
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
