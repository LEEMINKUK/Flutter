import 'package:chap03_flutter_onboarding/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('등원 할때의 나'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Image.network(
                    'http://file3.instiz.net/data/file3/2021/04/08/e/f/2/ef2a8b18fa6ebd759a0d7fc2e16eaaf0.jpg')),
            SizedBox(height: 20),
            Text(
              '집이 최고야...',
              style: TextStyle(color: Colors.red, fontSize: 35),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('홈페이지'))
          ],
        ),
      ),
    );
  }
}
