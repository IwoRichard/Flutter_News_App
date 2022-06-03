// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app_/services/health_api.dart';
import '../../models/news_model.dart';
import '../../theme/colors.dart';
import '../widgets/news_list.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Container(
          color: primary,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Text("Health",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),)),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, 
        icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Article>>(
                future: HealthApiService().fetchHealthNews(),
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator(color: blue,),);
                  } else {
                    List<Article> newsArticle = snapshot.data!;
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index){
                        return NewsTile(article: newsArticle[index]); //check widgets folder for the newslist file
                      }
                    );
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}