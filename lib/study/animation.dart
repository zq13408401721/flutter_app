import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(AnimationApp());

class AnimationApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AnimationState();
  }

}

class AnimationState extends State<AnimationApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animation",
      home: GestureDetector(
        onTap: (){
          print("click");
        },
        onTapDown: (tabDown){
          print("tabDown");
        },
        child: ListView(
          children: <Widget>[
            Text("位移动画"),
            Text("变形动画"),
          ],
        ),
      ),
    );
  }

}
