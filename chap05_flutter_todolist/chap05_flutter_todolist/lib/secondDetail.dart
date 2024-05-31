import 'package:flutter/material.dart';

class Seconddetail extends StatelessWidget {
  const Seconddetail({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('second Page'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.of(context).pop(controller.value.text),
                },
                child: Text('저장 하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
