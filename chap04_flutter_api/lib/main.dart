import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  const HttpApp({super.key});

  @override
  State<HttpApp> createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  String result = ""; // 검색 결과를 저장할 변수
  List? data; // null 이 가능 하게 검색 결과 데이터를 저장할 리스트
  TextEditingController? _editingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = new List.empty(growable: true); // 동적으로 크기 변경 가능 하게 초기화
    _editingController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: '검색어를 입력하세요'),
        ),
      ),
      body: Container(
        child: Center(
            child: data!.length == 0
                ? Text('데이터가 없습니다.',
                    style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text(data![index]['title'].toString()),
                              Text(data![index]['authors'].toString()),
                              Text(data![index]['sale_price'].toString()),
                              Text(data![index]['status'].toString()),
                              Image.network(
                                data![index]['thumbnail'],
                                height: 100,
                                width: 100,
                                fit: BoxFit.contain,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: data!.length,
                  )),
      ),
      bottomNavigationBar: Row(
        children: [
          BottomAppBar(
            child:  Images.,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
          data!.clear();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        'https://dapi.kakao.com/v3/search/book?target=title&query=${_editingController!.value.text}';
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK 584b39536d9e9f72c0eeb96501642e2b"});
    print(response.body);

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      // (!) : null 확인 연산자 = null이 아닌걸 검증
      data!.addAll(result); // 기존 데이터에 새로운 결과 추가
    });
    return response.body;
  }
}
