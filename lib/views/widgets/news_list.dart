// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/news_model.dart';
import '../../theme/colors.dart';

class NewsTile extends StatelessWidget {

  final Article article;
  const NewsTile({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final url = article.url??"Sorry, could not load URL";
        if(await canLaunch(url)){
          await launch(
            url,
            forceWebView: true,
            enableJavaScript: true,
          );
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17,color: Colors.white),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text(article.source!.name ?? "",style: TextStyle(color: blue),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 25,),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage ?? ""),
                    fit: BoxFit.cover,
                    ),
                ),
              ),
            ],
          ),
          Divider(height: 10,thickness: 0.25,color: chipBorder,)
        ],
      ),
    );
  }
}