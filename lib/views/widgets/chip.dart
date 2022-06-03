// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app_/views/screens/business_page.dart';
import '../../theme/colors.dart';
import '../screens/entertainment_page.dart';
import '../screens/health_page.dart';
import '../screens/science_page.dart';
import '../screens/sports_page.dart';
import '../screens/technology_page.dart';

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
                builder: (context) => BusinessPage()
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
                builder: (context) => EntertainmentPage()
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
                builder: (context) => HealthPage()
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
                builder: (context) => SciencePage()
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
                builder: (context) => SportsPage()
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
                builder: (context) => TechnologyPage()
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