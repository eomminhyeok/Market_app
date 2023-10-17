// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study/View/Buying/itemPage.dart';
import 'package:study/View/Buying/searchPage.dart';
import 'package:study/View/Login/loginPage.dart';
import 'package:study/View/Login/sign.dart';
import 'package:study/View/Sales/S_ListPage.dart';
import 'package:study/View/Sales/S_Registration.dart';
import 'package:study/View/ServicePage/chargingPage.dart';
import 'package:study/View/ServicePage/mainPage.dart';
import 'package:study/View/ServicePage/myPage.dart';
import 'package:study/View/Buying/biddingPage.dart';
import 'package:study/View/Sales/S_detailPage.dart';
import 'package:study/View/Buying/buyingList.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: MainHome()));

//test
const seedColor = Color(0xfffff000);

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final Dio dio = Dio();
 // test
  Future<void> fetchDataFromServer() async {
    try {
      // Express 서버의 엔드포인트 URL을 여기에 입력
      final response = await dio.get('http://localhost:8001/');

      if (response.statusCode == 200) {
        final data = response.data;
        // 데이터를 처리하거나 화면에 표시하는 로직 추가
        print(data);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '마켓',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        'mainPage': (context) => MainPage(),
        'signPage': (context) => SignPage(),
        'itemPage': (context) => ItemPage(),
        'searchPage': (context) => SearchPage(),
        'loginPage': (context) => LoginPage(),
        'S_ListPage': (context) => SalesList(),
        'S_Registration': (context) => SalesRegistration(),
        'chargingPage': (context) => ChargingPage(),
        'myPage': (context) => MyPage(),
        'biddingPage': (context) => BiddingList(),
        'salesDetail': (context) => SalesDetail(),
        'buyingList': (context) => BuyingList(),
      },
    );
  }
}
