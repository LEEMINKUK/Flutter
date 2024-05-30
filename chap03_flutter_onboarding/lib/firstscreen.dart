import 'package:chap03_flutter_onboarding/homepage.dart';
import 'package:chap03_flutter_onboarding/secondscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'onboarding.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('집에 가고 싶다.'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                  'https://cdn.newskrw.com/news/photo/202402/29483_47569_434.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              '집에 가고 싶다...',
              style: TextStyle(color: Colors.red, fontSize: 35),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              '매우 격하게 집에 가고 싶습니다 \n 그런데 못가요 \n 배도 고프고😔 \n 아무튼 찡찡찡찡😂..',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  prefs.setBool('isOnboarded', true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Skip')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                child: Text('다음'))
          ],
        ),
      ),
    );
  }
}
