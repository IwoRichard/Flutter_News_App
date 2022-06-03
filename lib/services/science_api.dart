// ignore_for_file: prefer_final_fields

import 'package:dio/dio.dart';
import '../models/news_model.dart';

class ScienceApiService {
  static String _apiKey ='033a693c19e440ad8d1bc53afc769d35';
  String _url = 'https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=$_apiKey';

  final _dio = Dio();

  Future <List<Article>>fetchScienceNews() async {
    try{
      Response response = await _dio.get(_url);
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse.articles;
    } on DioError catch (e){
      print(e);
    }
    throw ("Can't Retrieve");
  }  
}