import 'package:flutter/material.dart';
import 'package:newsapp/Api/Models/AricaleModels/Articles.dart';

import 'ArticilThumbNail.dart';

class ArticlesScreen extends StatelessWidget {
  List<Articles> articles ;
  ArticlesScreen ({required this.articles});
  @override
  Widget build(BuildContext context) {
    debugPrint(articles.length.toString());
    return ListView.builder(
      itemBuilder: (context, index) => ArticleShow(articles[index]),
      itemCount: articles.length,
    );
  }
}
