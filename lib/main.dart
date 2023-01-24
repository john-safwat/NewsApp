import 'package:flutter/material.dart';
import 'package:newsapp/Presntation/Theme/mytheme.dart';
import 'package:newsapp/Presntation/UI/Home/HomeScreen.dart';
import 'package:newsapp/Presntation/UI/News/Artecalis/Fulldata/FullArticleData.dart';
import 'package:newsapp/Presntation/UI/Search/SearchScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:newsapp/Presntation/UI/Splash/SplashScreen.dart';
void main ()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        FullArtecaleScreen.routeName : (_) => FullArtecaleScreen(),
        HomeScreen.routeName : (_) => HomeScreen(),
        SearchScreen.routeName :(_) => SearchScreen(),
        SplashScreen.routeName :(_) => SplashScreen(),
      },
      theme: MyTheme.Light,
      home: AnimatedSplashScreen(
        duration: 4000,
        splashIconSize: double.infinity,
        splash: SplashScreen(),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
