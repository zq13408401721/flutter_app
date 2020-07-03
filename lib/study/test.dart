
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/study/click.dart';

void main() => runApp(TestApp());

class TestApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TestState();
  }

}

class TestState extends State<TestApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"testApp",
      home:  Scaffold(
        appBar: AppBar(
          title: Text("Test"),
        ),
        body:Column(
          children: <Widget>[
            Text("指针点击事件",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.red),),
            createClickColumn(),
            Text("手势点击事件",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.red),),
          ],
        ),
      ),
    );
  }
}
