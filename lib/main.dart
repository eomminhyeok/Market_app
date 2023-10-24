// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
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
import 'package:get/get.dart';

void main() {
  runApp(MaterialApp(home: MainHome()));
}

const seedColor = Color(0xfffff000);

class MainHome extends StatelessWidget {
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
      getPages: [
        GetPage(name: '/mainPage', page: () => MainPage()),
        GetPage(name: '/signPage', page: () => SignPage()),
        GetPage(name: '/itemPage', page: () => ItemPage()),
        GetPage(name: '/searchPage', page: () => SearchPage()),
        GetPage(name: '/loginPage', page: () => LoginPage()),
        GetPage(name: '/S_ListPage', page: () => SalesList()),
        GetPage(name: '/S_Registration', page: () => SalesRegistration()),
        GetPage(name: '/chargingPage', page: () => ChargingPage()),
        GetPage(name: '/myPage', page: () => MyPage()),
        GetPage(name: '/biddingPage', page: () => BiddingList()),
        GetPage(name: '/salesDetail', page: () => SalesDetail()),
        GetPage(name: '/buyingList', page: () => BuyingList()),
      ],
    );
  }
}