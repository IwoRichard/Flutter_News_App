// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:news_app_/services/headline_api.dart';
import 'package:news_app_/views/widgets/chip.dart';
import '../../models/news_model.dart';
import '../../theme/colors.dart';
import '../widgets/news_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Discover",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                  SizedBox(height: 2,),
                  Opacity(opacity: 0.5, child: Text("Find interesting news and articles",style: TextStyle(color: Colors.white),)),
                  SizedBox(height: 20,),
                  NewsChip(), //check widgets folder for the chip file
                ],
              ),
              SizedBox(height: 20,),
              Container(
                color: primary,
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Text("Top News",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),)),
              SizedBox(height: 10,),
              Expanded(
                child: FutureBuilder<List<Article>>(
                  future: HeadlineApiServices().fetchHeadlineNews(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator.adaptive(backgroundColor: blue,),);
                    } else {
                      List<Article> newsArticle = snapshot.data!;
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: newsArticle.length,
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
      ),
    );
  }
}