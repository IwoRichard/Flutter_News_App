// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app_/views/screens/category_page.dart';
import '../../theme/colors.dart';

class NewsChip extends StatefulWidget {
  const NewsChip({Key? key}) : super(key: key);

  @override
  State<NewsChip> createState() => _NewsChipState();
}

class _NewsChipState extends State<NewsChip> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 15,
      runSpacing: 15,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryPage(categoryQuery: 'Business')
                )
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Business",style: TextStyle(color: Colors.white),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryPage(categoryQuery: 'Entertainment')
                )
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Entertainment",style: TextStyle(color: Colors.white),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryPage(categoryQuery: 'Health')
                )
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Health",style: TextStyle(color: Colors.white),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryPage(categoryQuery: 'Science')
                )
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Science",style: TextStyle(color: Colors.white),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryPage(categoryQuery: 'Sports')
                )
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Sports",style: TextStyle(color: Colors.white),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryPage(categoryQuery: 'Technology')
                )
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Technology",style: TextStyle(color: Colors.white),),
          ),
        ),
      ],
    );
  }
}