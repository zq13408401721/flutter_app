
import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "轮播图",
      home: Banner(),
    );
  }

}

class Banner extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return BannerState();
  }
}

/**
 * 封装一个可以监听读取网络图片加载之后的属性
 */
Stack _createNetImage(BuildContext context,String url){
  Image image = Image.network(url);
  Completer<ui.Image> completer = new Completer<ui.Image>();
  /*image.image.resolve(ImageConfiguration()).addListener(ImageStreamListener(

  ));*/
  return Stack();
}

ImageStreamListener _getListener([ImageLoadingBuilder loadingBuilder]){

}

class BannerState extends State<Banner>{
  PageController _pageController;

  Timer _timer;
  int _index = 0;

  //初始化方法
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _index, //默认在第几个
      viewportFraction: 1, //占屏幕多少，1为满屏
      keepPage: true, //是否保存当前Page状态
    );

    //定时器
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _index++;
      _pageController.animateToPage(
          _index%3,
          duration: Duration(milliseconds: 16), //跳转间隔时间
          curve: Curves.fastOutSlowIn, //跳转动画
      );
    });

  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: PageView(
        scrollDirection: Axis.horizontal,
        reverse: false,
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        pageSnapping: true,
        onPageChanged: (index){
          print('index：${index}');
        },
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                width: double.maxFinite,
                color: Colors.red,
                child: Image.network(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593433848170&di=d82eb38b8acb5d89afe05e0bbe239d24&imgtype=0&src=http%3A%2F%2Fwww.33lc.com%2Farticle%2FUploadPic%2F2012-10%2F2012102514201759594.jpg",
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                width: double.maxFinite,
                color: Colors.red,
                child: Image.network(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593433848171&di=79c4d9e225f3dbe5b8e9409046265ed4&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201105%2F17%2F113554rnu40q7nbgnn3lgq.jpg",
                  alignment: Alignment.topCenter,
                  fit:BoxFit.fitWidth,
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: double.maxFinite,
                height: 200.0,
                color: Colors.red,
                child: Image.network(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593433848170&di=ab3522f1f1a7238448de60b3aec0cc10&imgtype=0&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F96816e259928dac6aafd5894b7cdb87d.jpeg",
                  alignment: Alignment.topCenter,
                  fit:BoxFit.fitWidth,
                ),
              )
            ],
          ),
        ],
      ),
    );

  }

}

