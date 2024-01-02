import 'package:flutter/material.dart';


class BuyingDialogClass {
  TextEditingController costController = TextEditingController();
  int bidCost = 0;

  static void buying(
      BuildContext context, VoidCallback onBuy, VoidCallback onCancel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('즉시구매'),
          content: Text('정말로 상품을 구매하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 현재 다이얼로그 닫기
                onBuy(); // '구매' 버튼을 눌렀을 때 실행할 동작
              },
              child: Text('구매', style: TextStyle(color: Colors.blue)),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // 현재 다이얼로그 닫기
                onCancel(); // '취소' 버튼을 눌렀을 때 실행할 동작
              },
              child: Text('취소', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

 void inputCost(BuildContext context, VoidCallback onConfirm, VoidCallback onCancel) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('입찰 금액'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('입찰할 금액을 적어주세요'),
              TextField(
                controller: costController,
                keyboardType: TextInputType.number, // 숫자 입력용 키보드
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 현재 다이얼로그 닫기
                bidCost = int.parse(costController.text);
                onConfirm(); 
              },
              child: Text('확인', style: TextStyle(color: Colors.blue)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 현재 다이얼로그 닫기
                onCancel(); // '취소' 버튼을 눌렀을 때 실행할 동작
              },
              child: Text('취소', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  void bidding(
      BuildContext context, VoidCallback onBid, VoidCallback onCancel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('입찰'),
          content: Text('정말로 상품을 ${costController.text}P에 입찰 하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 현재 다이얼로그 닫기
                onBid(); // '입찰' 버튼을 눌렀을 때 실행할 동작
              },
              child: Text('입찰', style: TextStyle(color: Colors.blue)),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 현재 다이얼로그 닫기
                onCancel(); // '취소' 버튼을 눌렀을 때 실행할 동작
              },
              child: Text('취소', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  static void notEnoughMoney(
      BuildContext context, VoidCallback charging, VoidCallback onCancel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('포인트 부족'),
          content: Text('포인트가 부족합니다. 충전하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 현재 다이얼로그 닫기
                charging(); // '충전페이지로 이동'
              },
              child: Text('충전', style: TextStyle(color: Colors.blue)),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 현재 다이얼로그 닫기
                onCancel(); // '취소' 버튼을 눌렀을 때 실행할 동작
              },
              child: Text('취소', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
