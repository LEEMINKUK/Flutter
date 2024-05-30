import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'lastscreen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('집에 도착 하고의 나의 모습'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Image.network(
                    'https://image.edaily.co.kr/images/photo/files/NP/S/2024/01/PS24012700155.jpg')),
            SizedBox(height: 20),
            Text(
              '집에 도착 하고의 나의 모습',
              style: TextStyle(color: Colors.amberAccent, fontSize: 35),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              '항상 집에 갈때 마다 느끼지만 \n 집이 최고야 \n 짜릿해 \n 매일 새로워!',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LastScreen()));
                },
                child: Text('다음'))
          ],
        ),
      ),
    );
  }
}
