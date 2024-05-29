import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedList extends StatefulWidget {
  const FeedList({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  // 좋아요 여부
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 시작 측으로 정렬
      children: [
        Image.network(widget.imageUrl,
            height: 400,
            width: double.infinity, // 너비를 최대치로
            fit: BoxFit.cover), // 박스 크기에 맞춰서
        // 아이콘 목록
        Row(
          children: [
            IconButton(
              icon: Icon(CupertinoIcons.heart,
                  color: isFavorite ? Colors.red : Colors.black),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
            IconButton(
              icon: Icon(CupertinoIcons.chat_bubble, color: Colors.black),
              onPressed: () {},
            ),
            Spacer(), // 빈공간 추가
            IconButton(
              icon: Icon(CupertinoIcons.bookmark, color: Colors.black),
              onPressed: () {},
            )
          ],
        ),
        //좋아요
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "3 좋아요",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // 피드 글작성
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("귀여운 고양이, 최고의 조합 😊💕💕 \n #CatLige #Cat"),
        ),
        // 날짜
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "May 29",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
