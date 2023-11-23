import 'dart:ui';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

String? selectedValue;

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('검색'),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: screenWidth * 0.02, vertical: screenHeight * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                              '게시글',
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
                              enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.zero,
                          ),
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
                                '검색',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromRGBO(131, 184, 176, 176))),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02,),
                      Flexible(
                    flex: 1,
                    child: Container(
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        color: Colors.white,
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: DropdownButton<String>(
                          value: selectedValue,
                          hint: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '정렬기준',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 101, 99, 99),
                                  fontSize: 25),
                            ),
                          ),
                          
                          items: [
                            DropdownMenuItem<String>(
                              value: 'Option 1',
                              child: Text('최신순'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Option 2',
                              child: Text('입찰가격높은순'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Option 3',
                              child: Text('입찰가격낮은순'),
                            ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                    ],
                  ),
              SizedBox(height: screenHeight * 0.02),
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
                          '금액',
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.04,
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      height: screenHeight * 0.036,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.01,
                  ),
                  Flexible(flex: 1, child: Text('~')),
                  SizedBox(
                    width: screenWidth * 0.01,
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      height: screenHeight * 0.036,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Divider(
                thickness: 2,
                height: 1,
                color: Color.fromARGB(108, 164, 161, 161),
              ),
              SizedBox(
                width: screenWidth * 0.02,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: InkWell(
                  onTap: () {
                      Navigator.pushNamed(
                        context,
                        "itemPage");
                  },
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
                                SizedBox(height: screenHeight * 0.01),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '게시일 : 2023.05.16',
                                    style: TextStyle(fontSize: 12.5),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '남은 시간 : 14h 32m',
                                    style: TextStyle(
                                        fontSize: 12.5, color: Colors.red),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '즉시 구매가 : 260,000P',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '현재 입찰가 : 230,000P',
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
                                SizedBox(height: screenHeight * 0.01),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '게시일 : 2023.05.16',
                                    style: TextStyle(fontSize: 12.5),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '남은 시간 : 14h 32m',
                                    style: TextStyle(
                                        fontSize: 12.5, color: Colors.red),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '즉시 구매가 : 260,000P',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '현재 입찰가 : 230,000P',
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
                                SizedBox(height: screenHeight * 0.01),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '게시일 : 2023.05.16',
                                    style: TextStyle(fontSize: 12.5),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '남은 시간 : 14h 32m',
                                    style: TextStyle(
                                        fontSize: 12.5, color: Colors.red),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '즉시 구매가 : 260,000P',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '현재 입찰가 : 230,000P',
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
                                SizedBox(height: screenHeight * 0.01),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '게시일 : 2023.05.16',
                                    style: TextStyle(fontSize: 12.5),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '남은 시간 : 14h 32m',
                                    style: TextStyle(
                                        fontSize: 12.5, color: Colors.red),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '즉시 구매가 : 260,000P',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '현재 입찰가 : 230,000P',
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
                                SizedBox(height: screenHeight * 0.01),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '게시일 : 2023.05.16',
                                    style: TextStyle(fontSize: 12.5),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '남은 시간 : 14h 32m',
                                    style: TextStyle(
                                        fontSize: 12.5, color: Colors.red),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '즉시 구매가 : 260,000P',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '현재 입찰가 : 230,000P',
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
                                SizedBox(height: screenHeight * 0.01),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '게시일 : 2023.05.16',
                                    style: TextStyle(fontSize: 12.5),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '남은 시간 : 14h 32m',
                                    style: TextStyle(
                                        fontSize: 12.5, color: Colors.red),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '즉시 구매가 : 260,000P',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.5,
                                  child: Text(
                                    '현재 입찰가 : 230,000P',
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