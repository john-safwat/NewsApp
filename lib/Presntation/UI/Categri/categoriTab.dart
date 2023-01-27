import 'package:flutter/material.dart';
import 'package:newsapp/Presntation/Theme/mytheme.dart';
import 'package:newsapp/Presntation/UI/Categri/ButtonWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriScreen extends StatelessWidget {
  Function ChangeIndex ;
  CategoriScreen({required this.ChangeIndex});
  List<Categori> items = [
    Categori(CategoriID: "sports", Title: "Sports", Image: "assets/sports.png", BGcolor:const Color(0xffC91C22)),
    Categori(CategoriID: "technology", Title: "Politics", Image: "assets/Politics.png", BGcolor:const Color(0xff003E90)),
    Categori(CategoriID: "health", Title: "Health", Image: "assets/health.png", BGcolor:const Color(0xffED1E79)),
    Categori(CategoriID: "business", Title: "Bussines", Image: "assets/bussines.png", BGcolor:const Color(0xffCF7E48)),
    Categori(CategoriID: "entertainment", Title: "Environment", Image: "assets/environment.png", BGcolor:const Color(0xff4882CF)),
    Categori(CategoriID: "science", Title: "Science", Image: "assets/science.png", BGcolor:const Color(0xffF2D352)),
  ];
  @override
  Widget build(BuildContext context) {
    items[0].Title = AppLocalizations.of(context)!.sports;
    items[1].Title = AppLocalizations.of(context)!.politics;
    items[2].Title = AppLocalizations.of(context)!.health;
    items[3].Title = AppLocalizations.of(context)!.bussines;
    items[4].Title = AppLocalizations.of(context)!.environment;
    items[5].Title = AppLocalizations.of(context)!.science;

    return Container(
      padding:const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Pick Your Categori of intersets",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: MyTheme.Gray
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6/7,
                mainAxisSpacing: 20 ,
                crossAxisSpacing: 20
              ),
              itemBuilder: (context, index) => PickCategoriButton(categori: items[index] , index: index, ChangeIndex: ChangeIndex),
              itemCount: 6,
            ),
          ),
          const SizedBox(height: 20,),

        ],
      ),
    );
  }
}

class Categori {
  String CategoriID ;
  String Title ;
  String Image ;
  Color BGcolor ;

  Categori({
    required this.CategoriID,
    required this.Title ,
    required this.Image ,
    required this.BGcolor
  });
}
