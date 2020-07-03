
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}

class MyAppState extends State<MyApp>{

  GlobalKey<GlobalKeyTestState> _globalKey = GlobalKey<GlobalKeyTestState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GlobalKey",
      home: Scaffold(
        appBar: AppBar(
          title: Text("GlobalKey"),
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GlobalKeyTest(
                key: _globalKey,
              ),
              RaisedButton(
                child: Text("Add"),
                onPressed: (){
                  _globalKey.currentState.addCount(20);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}

class GlobalKeyTest extends StatefulWidget{

  GlobalKeyTest({Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return GlobalKeyTestState();
  }

}

class GlobalKeyTestState extends State<GlobalKeyTest>{

  int count = 0;
  addCount(int x){
    setState(() {
      count += x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            count.toString(),
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
    );
  }


}

