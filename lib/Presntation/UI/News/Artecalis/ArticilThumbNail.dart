import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Api/Models/AricaleModels/Articles.dart';
import 'package:newsapp/Presntation/Theme/mytheme.dart';
import 'package:newsapp/Presntation/UI/News/Artecalis/Fulldata/FullArticleData.dart';

class ArticleShow extends StatelessWidget {
  Articles article;
  ArticleShow (this.article);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: (){
          Navigator.pushNamed(context, FullArtecaleScreen.routeName , arguments: article);
        },
        child: Column(
          children: [
            // the image
            ClipRRect(
              borderRadius:const BorderRadius.all(Radius.circular(10)),
              child: Image.network(article.urlToImage!),
            ),
            // whiteSpae
            const SizedBox(height: 10,),
            // the source tiele
            Row(
              children: [
                Text(
                  article.source!.name!,
                  style: const TextStyle(
                    color: MyTheme.Gray,
                  ),
                )
              ],
            ),
            // The article Dicribtion
            Container(
              margin:const EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              child: Text(
                article.title!,
                style:const TextStyle(
                  fontSize: 16 ,
                  fontWeight: FontWeight.w500,
                  color: MyTheme.Black,
                ),
              ),
            ),
            // the time published
            SizedBox(
              width: double.infinity,
              child: Text(
                article.publishedAt!.substring(0 , 10),
                style: const TextStyle(
                  color: MyTheme.Gray
                ),
                textAlign: TextAlign.end,
              ),
            )
          ],
        ),
      ),
    );
  }
}
