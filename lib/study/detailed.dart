
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(DetailedPage());

class DetailedPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detailed Page',
      home: Scaffold(
        appBar: AppBar(
          title: Text("detailed"),
        ),
        body:Page(),
      ),
    );
  }
}

class Page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PageState();
  }
}

/**
 * 圆角图片
 */
Container roundImage = new Container(
  //距离上一个组件的margin
  margin: EdgeInsets.all(10.0),
  child: new ClipRRect(
    //圆角
    borderRadius: BorderRadius.circular(10.0),
    child: new Image.network(
      "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1440658265,610627178&fm=26&gp=0.jpg",
      width: window.physicalSize.width,
      height: 240.0,
      fit: BoxFit.cover,
    ),
  ),
);

/**
 * 图标
 */
Column buildBtnColumn(BuildContext context,IconData icon,String lab){
  Color color = Theme.of(context).primaryColor;
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon,color: color),
      Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Text(
          lab,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}

class PageState extends State<Page>{
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 240.0,
              child:Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593421194300&di=891fc7425616db05d5e629b0e616141c&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201311%2F17%2F174124tp3sa6vvckc25oc8.jpg',
              ),
            ),
            roundImage,
            Container(
              padding: EdgeInsets.all(32.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "这是标题内容",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text("内容描述！")
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.red[500],
                  ),
                  Text("40"),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildBtnColumn(context, Icons.call, 'CALL'),
                  buildBtnColumn(context, Icons.near_me, 'ROUTE'),
                  buildBtnColumn(context, Icons.share, 'SHARE'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
