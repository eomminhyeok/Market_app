import 'package:flutter/material.dart';

class BasicDialogClass {
  static void basicDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 팝업 닫기
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}