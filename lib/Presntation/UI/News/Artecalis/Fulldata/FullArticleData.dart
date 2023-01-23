import 'package:flutter/material.dart';
import 'package:newsapp/Api/Models/AricaleModels/Articles.dart';
import 'package:newsapp/Presntation/Theme/mytheme.dart';
import 'package:url_launcher/url_launcher.dart';

class FullArtecaleScreen extends StatelessWidget {
  static const String routeName = 'full article';

  @override
  Widget build(BuildContext context) {
    Articles article = ModalRoute.of(context)?.settings.arguments as Articles;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/pattern.png'),
          fit: BoxFit.cover,
        ),
        color: Colors.white
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(article.title!),
        ),
        body: Padding(
          padding:const EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(article.urlToImage!), 
              ),
              const SizedBox(height: 20,),
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
              ),
              const SizedBox(height: 30,),
              Expanded(
                  child:SingleChildScrollView(
                    child: Text(
                      article.description! ,
                      style: const TextStyle(
                        color: MyTheme.Gray,
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                      ),
                    ),
                  )
              ),
              SizedBox(
                height: 50,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: ()async{
                    Uri url = Uri.parse(article.url!);
                    if(await canLaunchUrl(url)){
                      await launchUrl(url);
                    }else{
                      Exception("Url Not Found");
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:const [
                      Text(
                        "View Full Article ",
                        style: TextStyle(
                          color: MyTheme.Gray
                        ),
                      ),
                      Icon(Icons.play_arrow_rounded , color: MyTheme.Gray,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
