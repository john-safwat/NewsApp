import 'package:flutter/material.dart';
import 'package:newsapp/Presntation/Theme/mytheme.dart';
import 'package:newsapp/Presntation/UI/Categri/categoriTab.dart';
import 'package:newsapp/Presntation/UI/News/DetalisTap.dart';
import 'package:newsapp/Presntation/UI/Search/SearchScreen.dart';
import 'package:newsapp/Presntation/UI/Settings/Settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const  String routeName = "homescrem";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String Title =  "";
  int TabIndex = 6 ;
  String CatregoriID = '';
  @override
  Widget build(BuildContext context) {
    var MediaQ = MediaQuery.of(context).size;
    if (TabIndex == 6){
      Title = AppLocalizations.of(context)!.app_title;
    }
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/pattern.png"),
          fit: BoxFit.cover
        ),
        color: Colors.white
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title : Text(Title),
          actions: [
            TabIndex == 6 || TabIndex == 7? Container():
            IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, SearchScreen.routeName , arguments: CatregoriID);
                },
                icon:const Icon(Icons.search_rounded)
            ),
          ],
        ),
        // the side bar menu
        drawer: Drawer(
          child: Column(
            children: [
              // the title of the drawer
              Container(
                height: 150,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child:const Center(
                    child: Text("NewsApp!",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    )
                ),
              ),
              // white Space
              const SizedBox(height: 10,),
              // the button of the carigory
              InkWell(
                onTap: (){
                  setState(() {
                    TabIndex = 6;
                    Title = AppLocalizations.of(context)!.app_title;
                  });
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),

                  child: Row(
                    children: [
                      const Icon(Icons.list , color: MyTheme.Black ,size: 30,),
                      const SizedBox(width:5,),
                      Text(AppLocalizations.of(context)!.categori, style:const TextStyle(
                        fontSize: 24,
                        color: MyTheme.Black,
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
              ),
              // white Space
              const SizedBox(height: 10,),
              // the setting tap button
              InkWell(
                onTap: (){
                  setState(() {
                    TabIndex = 7;
                    Title = AppLocalizations.of(context)!.settings;
                  });
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Row(
                    children:  [
                      const Icon(Icons.settings_rounded , color: MyTheme.Black ,size: 30,),
                      const SizedBox(width:5,),
                      Text(AppLocalizations.of(context)!.settings , style: const TextStyle(
                          fontSize: 24,
                          color: MyTheme.Black,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        body: TabIndex == 6 || TabIndex == 7? TabIndex ==6? CategoriScreen(ChangeIndex: Change_Index,): SettingsTap() : DetalisTab(TabIndex , CatregoriID),
      ),
    );
  }
  void Change_Index (int Index , String title , String CID){
    setState(() {
      Title = title ;
      TabIndex = Index;
      CatregoriID = CID ;
    });
  }
}
