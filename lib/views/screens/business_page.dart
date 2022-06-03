// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app_/services/business_api.dart';
import '../../models/news_model.dart';
import '../../theme/colors.dart';
import '../widgets/news_list.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
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
          child: Text("Business",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),)),
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
                future: BusinessApiService().fetchBusinessNews(),
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator(color: blue,),);
                  } else {
                    List<Article> newsArticle = snapshot.data!;
                    return ListView.builder(
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