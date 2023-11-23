import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:study/model.dart';
import 'dart:io';
import 'package:study/repository/registration_repository.dart';

class SalesRegistration extends StatefulWidget {
  const SalesRegistration({super.key});

  @override
  State<SalesRegistration> createState() => _SalesRegistrationState();
}

String? selectedValue;

class _SalesRegistrationState extends State<SalesRegistration> {
  Product product = Get.find<Product>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController bidController = TextEditingController();
  final picker = ImagePicker();
  List<XFile?> multiImage = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('판매등록'),
      ),
      body: Padding(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: screenWidth * 0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '  판매등록',
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
              SizedBox(height: screenHeight * 0.05),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.16,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '제목',
                          style: TextStyle(
                              fontSize: screenWidth * 15,
                              fontWeight: FontWeight.bold),
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
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      height: screenHeight * 0.04,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                width: screenWidth * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: FloatingActionButton(
                            backgroundColor: Color.fromARGB(255, 96, 170, 232),
                            onPressed: () async {
                              multiImage = await picker.pickMultiImage();
                              setState(() {
                                //multiImage를 통해 갤러리에서 가지고 온 사진들은 리스트 변수에 저장되므로 addAll()을 사용해서 images와 multiImage 리스트를 합쳐줍니다.
                                if (multiImage != null) {
                                  if (multiImage!.length > 5) {
                                    multiImage = multiImage!.sublist(0, 5);
                                    // 이미지 개수가 2개 이상이면 SnackBar로 경고 메시지 표시
                                    final snackBar = SnackBar(
                                      content: Text('이미지는 최대 5개까지 선택할 수 있습니다.'),
                                      duration: Duration(seconds: 2), // SnackBar의 표시 시간 설정
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                  product.images.addAll(multiImage); 
                                }
                              });
                            },
                            child: Icon(
                              Icons.photo_library,
                              size: screenHeight * 0.03,
                            ),
                            mini: true,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.04,
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            height: screenHeight * 0.065,
                            width: screenWidth * 1,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (XFile? image in product.images)
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Container(
                                              width: screenWidth * 0.13,
                                              height: screenHeight * 1,
                                              child: Image.file(
                                                File(image!.path),
                                                width: screenWidth * 0.01,
                                                height: screenHeight *
                                                    0.1, //double.infinity, //이미지 세로길이 컨테이너에 가득 차게
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                product.images.remove(image);
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 9,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.04,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.008,
                    ),
                    Row(
                      children: [
                        Text(
                          '글 내용',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Container(
                      child: TextField(
                        controller: descriptionController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          hintText: '\n\n\n\n\n\n\n\n\n',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      height: null,
                      width: screenWidth * 0.9,
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.21,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '즉시구매가',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.04,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: priceController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                            height: screenHeight * 0.04,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.21,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '경매시작가',
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.04,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: bidController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                            height: screenHeight * 0.04,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
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
                                '등록시간',
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
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
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                              color: Colors.white,
                            ),
                            child: DropdownButton<String>(
                              value: selectedValue,
                              items: [
                                DropdownMenuItem<String>(
                                  value: 'Option 1',
                                  child: Text('24h'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Option 2',
                                  child: Text('48h'),
                                ),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue;

                                  product.createdTime.value = DateTime.now();

                                  if(selectedValue == 'Option 1') {
                                    product.expiryTime.value = (DateTime.now()).add(Duration(hours: 24));
                                  }
                                  else if(selectedValue == 'Option 2') {
                                    product.expiryTime.value = (DateTime.now()).add(Duration(hours: 48));
                                  }
                                });
                              },
                            ),
                            height: screenHeight * 0.03,
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
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.2,
                    height: screenHeight * 0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        product.title.value = titleController.text;
                        product.description.value = descriptionController.text;
                        int price = int.parse(priceController.text);
                        int bid = int.parse(bidController.text);
                        List<XFile> images = product.images.toList().cast<XFile>();
                        

                        RegistrationRepository regist = RegistrationRepository();

                        regist.registrationMethod(product.title.value, product.description.value, 
                        price, bid, images, product.createdTime.value, product.expiryTime.value);
                      },
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '판매등록',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 101, 175, 235)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
