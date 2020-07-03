
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 点击事件-指针
 */
Listener createClickListener(){
  return Listener(
    onPointerDown: (down){
      print("clickDown:${down}");
    },
    onPointerMove: (move){
      print("clickMove:${move}");
    },
    onPointerUp: (up){
      print("clickUp:${up}");
    },
    onPointerSignal: (single){
      print("clickSingle:${single}");
    },
    child: Center(
      child: Text(
        "text click!",
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}

/**
 * 创建按列排列 带有点击事件的效果
 */
Column createClickColumn(){
  return Column(
    children: <Widget>[
      MyClickView(
          clickListener: (data)=>{
            print("选择了$data")
          },
          view:Text("boss"),
          data: "boss",
      ),
      MyClickView(
        clickListener: (data)=>{
          print("选择了$data")
        },
        view:Text("总监"),
        data: "总监",
      ),
      MyClickView(
        clickListener: (data)=>{
          print("选择了$data")
        },
        view: Text("总裁"),
        data: "总裁",
      ),
      MyClickView(
        clickListener: (data)=> {
          print("选择了$data")
        },
        view:Text("总经理"),
        data: "总经理",
      ),
      MyClickView(
        clickListener: (data)=>{
          print("选择了$data")
        },
        view:Text("主管"),
        data: "主管",
      ),
    ],
  );
}

/**
 * 通过指针封装点击事件，解决界面上同时有多个组件需要点击事件
 * 通过回调方法响应点击事件的触发
 * 绑定数据使用泛型
 */
class MyClickView<T> extends Container{

  //可以带参数的函数回调
  ValueChanged clickListener;
  //VoidCallback不带参数的接口回调
  Widget view;
  T data;

  MyClickView({Key key,@required this.clickListener,@required this.view,@required this.data}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (down){
          clickListener(this.data);
        },
        child: view,
      );
  }
}