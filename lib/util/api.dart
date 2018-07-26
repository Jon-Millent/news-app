import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
Dio dio = new Dio();

class Api{
  static final String baseUrl = 'http://show.liluo.cc/api';

  getNews(String newType) async{
    return await dio.get(baseUrl + '/news/' + newType + '.json');
  }

}