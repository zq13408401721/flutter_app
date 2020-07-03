
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/study/DioUtil.dart';
import 'package:signature/signature.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "签名",
      home: SignView(),
    );
  }

}

class SignView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SignViewState();
  }

}

class SignViewState extends State<SignView>{

  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 5, //画笔大小
    penColor: Colors.red, //画笔颜色
    exportBackgroundColor: Colors.blue, //背景颜色
  );

  String data = "正在加载网络数据";

  @override
  void initState() {
    super.initState();
    _signatureController.addListener(() => print("value change"));
    DioUtil.request("index").then((value){
      print("获取到的数据：${value.data}");
      setState(() {
        data = value.data.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手写签名效果"),
      ),
      body: Builder(builder: (context) => ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: Center(
              child: Text(data),
            ),
          ),
          Signature(controller: _signatureController,height: 300.0,backgroundColor: Colors.lightBlueAccent,),
          Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.check),
                  color: Colors.blue,
                  onPressed: () async{
                    if(_signatureController.isNotEmpty){
                      var data = await _signatureController.toPngBytes();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context){
                            return Scaffold(
                              appBar: AppBar(),
                              body: Center(
                                child: Container(
                                  color: Colors.grey[300],
                                  child: Image.memory(data),
                                ),
                              ),
                            );
                          }
                        )
                      );
                    }
                  },
                ),
                IconButton(icon: const Icon(Icons.clear), color: Colors.blue, onPressed: (){
                  setState(() {
                    _signatureController.clear();
                  });
                }),
              ],
            ),
          ),
          Container(
            height: 300.0,
            child: Center(
              child: Text('Big container to test scrolling issues'),
            ),
          )
        ],
      )),
    );
  }

}

