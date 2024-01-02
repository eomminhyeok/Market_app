import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study/model.dart';
import 'package:intl/intl.dart';
import 'package:study/repository/posts_repository.dart';
import 'package:study/repository/search_repository.dart';



class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

String? selectedValue;

class _SearchPageState extends State<SearchPage> {
  Posts posts = Get.find<Posts>(); // 데이터모델에 RxList<Map<String, dynamic>> searchPosts = <Map<String, dynamic>>[].obs; 선언하였음
  SearchRepository searchRepository = SearchRepository();
  PostsRepository postsRepository = PostsRepository();
  ColorController color = Get.find<ColorController>();
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();
  final NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'ko_KR', customPattern: '#,##0P');
  TextEditingController titleController = TextEditingController();
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();


  void initState() {
    super.initState();
    posts.keyword.value = '';
    posts.min.value = 0;
    posts.max.value = 9223372036854775807;
    posts.lineUp.value = 'p.createdTime DESC';
    loadData(); // 페이지 초기 실행시 onRefresh 실행.(페이지 첫 로드시에도 게시글 목록을 표시하기위해)
  }
  
  Future<void> loadData() async {
    // 데이터를 새로 불러와 갱신
    posts.limit.value = 5; // 게시글 최대 개수
    await searchRepository.searchMethod();
    if (mounted) {
      // ui 업데이트
      setState(() {});
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    

    String formatDate(DateTime date) {
      // 날짜표기 포맷
      final formatter = DateFormat('yyyy.MM.dd   HH:mm');
      return formatter.format(date);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('검색'),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: screenWidth * 0.02, vertical: screenHeight * 0.03),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      controller: titleController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 186, 185, 185),
                              width: 1.0),
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
                  flex: 2,
                  child: Container(
                    width: screenWidth * 0.17,
                    child: ElevatedButton(
                      onPressed: () {
                        
                        
                        posts.keyword.value = titleController.text;

                        if (minController.text != null && // null 체크
                            minController.text.isNotEmpty) {
                          posts.min.value = int.parse(minController.text);
                        } else {
                          posts.min.value = 0;
                        }

                        if (maxController.text != null &&
                            maxController.text.isNotEmpty) {
                          posts.max.value = int.parse(maxController.text);
                        } else {
                          posts.max.value = double.maxFinite.toInt();
                        }

                        loadData();
                      },
                      child: Icon(
                        Icons.search,
                        size: screenHeight * 0.03,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        minimumSize: MaterialStateProperty.all(
                            Size(screenWidth * 0.03, screenHeight * 0.048)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(217, 145, 143, 143)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // 반지름 값을 조절하여 원하는 정사각형으로 만듭니다.
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.02,
                ),
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

                            if (selectedValue == 'Option 1') {
                              posts.lineUp.value = 'p.createdTime DESC';
                            } else if (selectedValue == 'Option 2') {
                              posts.lineUp.value = 'p.bid DESC';
                            } else if (selectedValue == 'Option 3') {
                              posts.lineUp.value = 'p.bid ASC ';
                            }
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
                      controller: minController,
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
                      controller: maxController,
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
            Expanded(
              // 상품 리스트
              child: RefreshIndicator(
                key: refreshKey, // RefreshIndicator의 key값 설정
                onRefresh: () async {
                  // 새로고침시 loadData 실행 및 RefreshIndicator의 child 실행
                  await loadData();
                },
                child: ListView.builder(
                  itemCount: posts.searchPosts.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: InkWell(
                            onTap: () {
                              Map<String, dynamic> arguments = {
                                'post': posts.searchPosts[index],
                                'index': index,
                              };
                              Get.toNamed('itemPage', arguments: arguments);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
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
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                            'http://10.0.2.2:8000/getImage?imagePath=${posts.searchPosts[index]['images'][0]}',
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.fill), //posts의 이미지
                                      ),
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
                                              posts.searchPosts[index]
                                                  ['title'], //posts의 title
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
                                              '게시일 : ' +
                                                  formatDate(posts
                                                          .searchPosts[index][
                                                      'createdTime']), //posts의 createdTime
                                              style: TextStyle(fontSize: 12.5),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          Container(
                                            width: screenWidth * 0.5,
                                            child: Text(
                                              '마감 시간 : ' +
                                                  formatDate(posts
                                                          .searchPosts[index][
                                                      'expiryTime']), //posts의 expiryTime
                                              style: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.red),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          SizedBox(height: screenHeight * 0.01),
                                          Container(
                                            width: screenWidth * 0.5,
                                            child: Text(
                                              '즉시 구매가 : ${currencyFormat.format(posts.searchPosts[index]['price'])}',
                                              style: TextStyle(fontSize: 15),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          Container(
                                            width: screenWidth * 0.5,
                                            child: Text(
                                              '현재 입찰가 : ${currencyFormat.format(posts.searchPosts[index]['bid'])}',
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
                        Divider(
                            thickness: 1,
                            height: screenHeight * 0.01,
                            color: Color.fromARGB(108, 164, 161, 161)),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
