import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' show json;

void main() => runApp(Page());

class Page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          title: "source demo",
          home: Scaffold(
            body: Column(
              children: <Widget>[
                HNav(),
                HNavBar(),
                AssetBundleLoad(),
                LoadJson(),
              ],
            ),
          ),
      );
  }
}

/**
 * asset资源读取
 * 在配置文件中配置asset的资源文件
 */
class HNav extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return HNavScrollState();
  }
}

/**
 * 带滚动的横向布局
 */
class HNavScrollState extends State<HNav>{
  @override
  Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            new Image.asset('assets/images/动车.png'),
            new Image.asset('assets/images/地铁.png'),
            new Image.asset('assets/images/房车.png')
          ],

        ),
      );
  }

}

/**
 * 横向排列
 */
class HNavBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HNavBarState();
  }

}

/**
 * 横向排列不超出
 */
class HNavBarState extends State<HNavBar>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: new Image.asset("assets/images/动车.png"),
          ),
          Expanded(
            child: new Image.asset('assets/images/地铁.png'),
          ),
          Expanded(
            child: new Image.asset('assets/images/房车.png'),
          ),
          Expanded(
            child: new Image.asset('assets/images/直升机.png'),
          ),
          Expanded(
            child: new Image.asset('assets/images/货车.png'),
          )
        ],
      ),
    );
  }
}

/**
 * AssetBundle
 */
class AssetBundleLoad extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AssetBundleLoadState();
  }
}

class AssetBundleLoadState extends State<AssetBundleLoad>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
          decoration:new BoxDecoration(
              image:new DecorationImage(image: new AssetImage('assets/images/货车.png'))
          )
      ),
    );
  }

}

/**
 * assets json文件加载
 */
Future<String> _loadConfig() async{
  return await rootBundle.loadString('assets/config/config.json');
}

class LoadJson extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoadJsonState();
  }

}

class LoadJsonState extends State<LoadJson>{
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: _loadConfig(),
        //future: DefaultAssetBundle.of(context).loadString("assets/config/config.json"),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<dynamic> data = json.decode(snapshot.data.toString());
            return new ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context,int index){
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("Ip:${data[index]["ip"]}"),
                        new Text("Port:${data[index]["port"]}")
                      ],
                    ),
                  );
                }
            );
          }
          return new CircularProgressIndicator();
        }
    );
  }

}
