// ignore_for_file: prefer_final_fields, avoid_print

import 'package:dio/dio.dart';
import '../models/news_model.dart';

class CategoryApiService {
  static String _apiKey ='033a693c19e440ad8d1bc53afc769d35';

  final _dio = Dio();

  Future <List<Article>>fetchCategoryNews(String query) async {
    try{
      Response response = await _dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=$query&apiKey=$_apiKey',
      );
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse.articles;
    } on DioError catch (e){
      print(e.toString());
    }
    throw Exception("Can't Retrieve");
  }  
}