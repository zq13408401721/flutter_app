
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ViewPager"),
      ),
      body: MyViewPager(),
    );
  }

}

class MyViewPager extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ViewPagerState();
  }

}

class ViewPagerState extends State<MyViewPager>{
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemBuilder: (BuildContext context,int index){
          
        }
    );
  }

}