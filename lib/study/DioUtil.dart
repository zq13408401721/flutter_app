
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioUtil{

  static const BASEURL = "https://cdwan.cn/api/";

  static Dio dio = new Dio();

  /**
   * 获取网络请求数据
   */
  static Future<Response> request(String url,{REQ method=REQ.GET,param}) async {
    url = BASEURL+url;
    Response response;
    if(method == REQ.GET){
      await dio.get(url).then((value){
        response=value;
      });
    }else if(method == REQ.POST){
      await dio.post(url,data:param).then((value){
        response = value;
      });
    }else if(method == REQ.REQUEST){
      await dio.request(url).then((value){
        response = value;
      });
    }
    return response;
  }
}

/**
 * 网络请求的枚举类
 */
enum REQ{
  GET,
  POST,
  REQUEST,
  DELETE,
}

