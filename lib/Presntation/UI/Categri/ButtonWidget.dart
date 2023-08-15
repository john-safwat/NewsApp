import 'package:flutter/material.dart';
import 'package:newsapp/Core/Provider/SettingsProvider.dart';
import 'package:newsapp/Presntation/UI/Categri/categoriTab.dart';
import 'package:provider/provider.dart';


class PickCategoriButton extends StatelessWidget {
  Categori categori ;
  int index ;
  Function ChangeIndex ;
  PickCategoriButton ({required this.categori , required this.index , required this.ChangeIndex});
  @override
  Widget build(BuildContext context) {
    var LanguageProvider = Provider.of<SettingsProvider>(context);
    return InkWell(
      onTap: (){
        ChangeIndex(index , categori.Title , categori.CategoriID) ;
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: categori.BGcolor,
          borderRadius: BorderRadius.only(
            topLeft:const  Radius.circular(20),
            topRight:const Radius.circular(20),
            bottomRight: LanguageProvider.Language == 'en'? index % 2 == 0 ?const Radius.circular(0):const Radius.circular(20):index % 2 == 0 ?const Radius.circular(20):const Radius.circular(0),
            bottomLeft: LanguageProvider.Language == 'en'? index % 2 == 0 ?const Radius.circular(20):const Radius.circular(0):index % 2 == 0 ?const Radius.circular(0):const Radius.circular(20),

          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(categori.Image),
            Text(categori.Title ,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
