
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(HDetailed());

/**
 * 横向布局
 */
class HDetailed extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HDetailed",
      home: Scaffold(
        body: HDetailedPage(),
      ),
    );
  }
}

class HDetailedPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HDetailedState();
  }
}

/**
 * 构建item
 */
Column buildItem(BuildContext context,IconData icon,String tab,String value){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Icon(icon,size: 18.0,),
      Text(tab,style: TextStyle(
        fontSize: 10.0,
      ),),
      Container(
        margin: const EdgeInsets.only(
          top: 10.0,
        ),
        child: Text(value,style: TextStyle(
          fontSize: 10.0,
        ),),
      ),
    ],
  );
}

/**
 * 横向布局页面
 */
class HDetailedState extends State<HDetailedPage>{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 5.0,
                bottom: 5.0,
              ),
              decoration:ShapeDecoration.fromBoxDecoration(BoxDecoration(
                color: Colors.blue[200],
                border: Border.all(width: 1.0)
              )),
              child: Text(
                "每日优鲜",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
                ),
              ),
            ),
            Container(
              width: 150.0,
              decoration: ShapeDecoration.fromBoxDecoration(BoxDecoration(
                border: Border.all(
                  color: Colors.blue[200],
                  width: 1.0,
                )
              )),
              child: Text(
                "每日优鲜提供新鲜的蔬菜水果，纯天然无污染！",
                style: TextStyle(
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 15.0,
              ),
              child: Row(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.star,color: Colors.blue,size: 14.0,),
                      Icon(Icons.star,color: Colors.blue,size: 14.0,),
                      Icon(Icons.star,color: Colors.blue,size: 14.0,),
                      Icon(Icons.star,color: Colors.blue,size: 14.0,),
                      Icon(Icons.star_half,color: Colors.blue,size: 14.0,),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 15.0,
                    ),
                    child: Text(
                      "200 times",
                      style: TextStyle(
                        fontSize: 12.0
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  buildItem(context, Icons.developer_board, "PREP:", "25 min"),
                  buildItem(context, Icons.access_alarm, "COOK:", "1 hr"),
                  buildItem(context, Icons.restaurant, "FEEDS:", "4-6"),
                ],
              ),
            )

          ],
        ),
        Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: Image.network(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593425768266&di=f5e6c03b640fc5cb7c1af9c50a798b10&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20171012%2Fa8d9a19854914570b757637b350763bb.jpeg",
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
        )
      ],
    );
  }

}
