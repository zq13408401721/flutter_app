
import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(GridViewApp());

final urls = [
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593433848171&di=79c4d9e225f3dbe5b8e9409046265ed4&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201105%2F17%2F113554rnu40q7nbgnn3lgq.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593433858349&di=69795dacd197a8f70b9c33967d166df0&imgtype=0&src=http%3A%2F%2Fimg3.imgtn.bdimg.com%2Fit%2Fu%3D3992873028%2C1734106948%26fm%3D214%26gp%3D0.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593433848170&di=d82eb38b8acb5d89afe05e0bbe239d24&imgtype=0&src=http%3A%2F%2Fwww.33lc.com%2Farticle%2FUploadPic%2F2012-10%2F2012102514201759594.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593433848170&di=ab3522f1f1a7238448de60b3aec0cc10&imgtype=0&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F96816e259928dac6aafd5894b7cdb87d.jpeg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593433848170&di=2b085dae4f5deb093bf9ffb0aa530367&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F8%2F584e716e9edf0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3968384972,1904332573&fm=26&gp=0.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593433848169&di=ff8c300a1ae07d44b5d6b1e67048a0b5&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F4ec2d5628535e5ddb3bca44976c6a7efcf1b6297.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593433848169&di=c785caa6491054d363491e2f9b4c46af&imgtype=0&src=http%3A%2F%2Fwww.yncjlh.com%2Ftemp%2Fimage%2Foriginal%2F1481018294592.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593433971545&di=33c603acc3fa172c5fc30a9cb4c6302a&imgtype=0&src=http%3A%2F%2Fpicture.ik123.com%2Fuploads%2Fallimg%2F131123%2F14-131123103301.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593433980257&di=b3b22da1e9842f2460b5f12c943b2605&imgtype=0&src=http%3A%2F%2Fimg1.imgtn.bdimg.com%2Fit%2Fu%3D3699267576%2C945824382%26fm%3D214%26gp%3D0.jpg"
];

Future<String> _getAssetsTile() async{
  return await rootBundle.loadString('assets/config/tile.json');
}

List<Container> _buildGridTileList(int count){
  return new List<Container>.generate(count, (index) =>
    new Container(child: new Image.network(urls[index]),)
  );
}

/**
 * 定义打开大图查看页面并且接受大图页面的数据返回
 */
_navigateToBigImage(BuildContext context,int position,List<dynamic> imgs) async{
  final result = await Navigator.push(context, new MaterialPageRoute(builder: (context)=>
  new BigImage(position: position,imgs: imgs,)
  ));
  print("result:${result}");
}

/**
 * 自定义item
 */
List<Container> _buildCustomizeGridTileList(BuildContext context,List<dynamic> list){
  return new List<Container>.generate(list.length, (index) =>
    new Container(
      color: Colors.red,
      alignment: Alignment.center,
      height: 100.0,
      child: Stack(
        alignment: Alignment(-1,1),
        children: <Widget>[
          //解决图片不填充满item的问题
          ConstrainedBox(
            child:GestureDetector(
              onTap: (){
                //查看大图
                _navigateToBigImage(context, index,list);
              },
              child: Image.network(list[index]['src'],fit: BoxFit.cover,),
            ),
            constraints: new BoxConstraints.expand(),
          ),
          Container(
            color: Colors.grey.withOpacity(0.3),
            padding: EdgeInsets.only(
              left: 5.0,
            ),
            height: 40.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(list[index]['name'],style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),),
                      Text(list[index]['tag'],style: TextStyle(
                        color:Colors.white,
                        fontSize: 12.0,
                      ),),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment(1,0),
                  //StatefulBuilder点击事件刷新界面的方法
                  child: StatefulBuilder(
                    builder:(BuildContext context,StateSetter setState){
                      return IconButton(
                        icon:Icon(list[index]['collect'] ? Icons.favorite : Icons.favorite_border,color: Colors.white,),
                        onPressed: (){
                          print("index:$index->${list[index]['collect']}");
                          setState((){
                            list[index]['collect'] = !list[index]['collect'];
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    )
  );
}

/**
 * 自定义GridView
 */
Widget _buildCustomizeGridView(){
  return FutureBuilder(
    future: _getAssetsTile(),
    builder: (context,snapshot){
      if(snapshot.hasData){
        List<dynamic> data = json.decode(snapshot.data);
        return new GridView.count(
          crossAxisCount: 3, //每行最大显示的数量
          mainAxisSpacing: 5.0, //垂直间距
          crossAxisSpacing: 5.0, //水平间距
          childAspectRatio: 1.5, //宽高比
          padding: EdgeInsets.all(5.0), //内边距
          children: _buildCustomizeGridTileList(context,data),
        );
      }
    }
  );
}

Widget buildNormalGridView(){
  return new GridView.extent(
    maxCrossAxisExtent: 150.0,
    padding: const EdgeInsets.all(4.0),
    mainAxisSpacing: 5.0,
    crossAxisSpacing: 5.0,
    children: _buildGridTileList(urls.length),
  );
}

class GridViewApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GridView",
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridView Normal"),
        ),
        body: GridViewCustomize(),
      ),
    );
  }
}

class GridViewCustomize extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return GridViewState();
  }

}

class GridViewState extends State<GridViewCustomize>{
  @override
  Widget build(BuildContext context) {
    return _buildCustomizeGridView();
  }

}


/**
 * 放大图片查看页面
 * 上一个也传入url
 * 关闭页面的时候回传数据
 */
class BigImage extends StatefulWidget{

  final int position;
  final List<dynamic> imgs;

  BigImage({Key key,@required this.position,@required this.imgs}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return BigImageState(this.position,this.imgs);
  }

}

/**
 * 申请权限
 */
Future<bool> _checkPermission(BuildContext context) async {
  //先做平台判断
  if(Theme.of(context).platform == TargetPlatform.android){
    //PermissionStatus permission = await PermissionHandler();
  }
}

/**
 * 带状态的大图查看器
 */
class BigImageState extends State<BigImage>{
  int position;
  final List<dynamic> imgs;

  BigImageState(this.position,this.imgs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("大图查看"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context,"查看大图关闭");
          },
        ),
      ),
      body:Container(
        child: Stack(
          children: <Widget>[
            Image.network(this.imgs[position]['src'],fit: BoxFit.cover,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 40.0,
                color: Colors.grey[200].withOpacity(0.8),
                child:Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios,color:position == 0 ? Colors.grey[300] : Colors.grey),
                        onPressed: (){
                          setState(() {
                            if(position > 0) position --;
                          });
                        },
                      ),
                      Text("${position+1}/${this.imgs.length}"),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios,color:position == imgs.length-1 ? Colors.grey[300] : Colors.grey),
                        onPressed: (){
                          setState(() {
                            if(position < imgs.length-1) position ++;
                          });
                        },
                      ),
                      Container(
                        width: 100.0,
                        alignment: Alignment(0,0),
                       /* child: Listener(
                            onPointerDown:(down){
                              print("pointer down");
                              return Text("下载");
                            }
                        ),*/
                       child: Listener(
                         child: Text("下载"),
                         onPointerDown: (down){
                           print("click");
                         },
                       ),
                      )
                    ],
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
