
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(CupertinoTab());

class CupertinoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Capertino demo",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: "cupertino title",
        ),
        backgroundColor: Colors.blue,
        child: Center(
          child: Text("cupertino content"),
        ),
      ),
    );
  }
}

class CupertinoTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "tab",
      home: Scaffold(
        body: MyTab(),
      ),
    );
  }

}

class Page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Demo",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Page")
          ),
          body:Container(
            child: new Column(
              children: <Widget>[
                //loading
                Loading(),
                CupertinoAlert(),
                CupertinoBtn(),
              ],
            ),
          ),
        ),
    );
  }

}

//loading状态
class Loading extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoadingState();
  }
}

class LoadingState extends State<Loading>{
  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: 30.0,
    );
  }
}

class CupertinoAlert extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CupertinoAlertState();
  }
}

class MyCupertinoDialog extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CupertinoDialogState();
  }
}

class CupertinoDialogState extends State<MyCupertinoDialog>{
  @override
  Widget build(BuildContext context) {
     return CupertinoDialog(
       child: Text("alert"),
     );
  }

}


class CupertinoAlertState extends State<CupertinoAlert>{
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title:Text("提示"),
      content: SingleChildScrollView(
        //内容部分
        child: ListBody(
          children: <Widget>[
            Text("是否要删除？"),
            Text("删除数据不可恢复！"),
          ],
        ),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text("ok"),
          onPressed: (){
            print("click ok!");
          },
        ),
        CupertinoDialogAction(
          child: Text("cancel"),
          onPressed: (){
            print("click cancel!");
          },
        )
      ],
    );
  }

}

class CupertinoBtn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return CupertinoBtnState();
  }
}

/**
 * CupertinoButton click times only one!
 */
class CupertinoBtnState extends State<CupertinoBtn>{
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text("cupertino button"),
      color: Colors.blue,
      onPressed: (){
        print("cupertino button click!");
      },
    );
  }

}

/*******************tab*****************************/

class MyTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon:Icon(
                Icons.home,
                color:Colors.blue,
            ),
            title: Text(
              "Page1",
              style: TextStyle(color: Colors.blue),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color:Colors.blue,
            ),
            title: Text(
              "Page2",
              style:TextStyle(color: Colors.blue),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box,
              color:Colors.blue
            ),
            title: Text(
              "Page3",
              style: TextStyle(color: Colors.blue),
            )
          )
        ],
      ),
      tabBuilder:(context,index){
        return CupertinoTabView(
          builder: (context){
            switch(index){
              case 0:
                return Page1();
                break;
              case 1:
                return Page2();
                break;
              case 2:
                return Page3();
                break;
            }
          },
        );
      },
    );
  }

}

Future<bool> _backClick(){
  print("back click");
  return new Future.value(false);
}

/**
 * 显示弹框
 */
_showDilog(BuildContext context){
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return new AlertDialog(
          title: new Text("标题"),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                Text("是否要退出当前页面？"),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("确定"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("取消"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
  ).then((value) => print("value"));
}

class Page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: (){
                print("back click");
                _showDilog(context);
              },
            ),
            middle: Text("Page1"),
            trailing: IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed:(){
                print("shared click");
              }
            )
          ),
          child: Align(
            child: Text("Page1"),
            alignment: Alignment.bottomCenter,
            widthFactor: 60.0,
            heightFactor: 30.0,
          ),
        ),
        onWillPop: _backClick,
    );
  }
}


class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text("page2"),
    );
  }
}

class Page3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text("page3"),
    );
  }
}

