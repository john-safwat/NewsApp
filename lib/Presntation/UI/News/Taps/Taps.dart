import 'package:flutter/material.dart';
import 'package:newsapp/Api/ApiManager/API_Manager.dart';
import 'package:newsapp/Api/Models/AricaleModels/Articles.dart';
import 'package:newsapp/Api/Models/AricaleModels/SourcesData.dart';
import 'package:newsapp/Api/Models/SourcesModels/Sources.dart';
import 'package:newsapp/Presntation/UI/News/Artecalis/ArticilThumbNail.dart';
import 'package:newsapp/Presntation/UI/News/Artecalis/articelsscreen.dart';
import 'package:newsapp/Presntation/UI/News/Taps/tap.dart';

class SourcesTaps extends StatefulWidget {
  List<Sources> sources;

  SourcesTaps ({required this.sources});

  @override
  State<SourcesTaps> createState() => _SourcesTapsState();
}

class _SourcesTapsState extends State<SourcesTaps> {
  bool isselected = false ;
  List<Articles> articles = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      child: Column(
        children: [
          // taps
          DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelPadding: const EdgeInsets.all(5),
              tabs: widget.sources.map((item) => TapButton(item , widget.sources.indexOf(item) == selectedIndex )).toList(),
              onTap: (index){
                setState(() {
                  selectedIndex = index ;
                });
              },
            ),
          ),
          // data
          Expanded(
              child: FutureBuilder<SourcesData> (
                future: ApiManager.GetFullData(widget.sources[selectedIndex].name!),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError){
                    return Center(
                      child: Text(
                        "ops server Have Error \n ${snapshot.hasError.toString()}"
                      ),
                    );
                  }
                  if (snapshot.data?.status == 'error'){
                    return Center(
                      child: Text(
                          "Error \n ${snapshot.data?.message}"
                      ),
                    );
                  }else{
                    articles = snapshot.data!.articles!;
                    return ArticlesScreen(articles: articles);
                  }
                },
              )
          )
        ],
      ),
    );
  }
}
