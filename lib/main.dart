import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newsapp/Core/Provider/SettingsProvider.dart';
import 'package:newsapp/Presntation/Theme/mytheme.dart';
import 'package:newsapp/Presntation/UI/Home/HomeScreen.dart';
import 'package:newsapp/Presntation/UI/News/Artecalis/Fulldata/FullArticleData.dart';
import 'package:newsapp/Presntation/UI/Search/SearchScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:newsapp/Presntation/UI/Splash/SplashScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main ()
{
  runApp(
      ChangeNotifierProvider(
        create: (context) => SettingsProvider(),
        child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  late SettingsProvider LanguageProvider ;
  @override
  Widget build(BuildContext context) {
    LanguageProvider = Provider.of<SettingsProvider>(context);
    getvalueFromShared();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        FullArtecaleScreen.routeName : (_) => FullArtecaleScreen(),
        HomeScreen.routeName : (_) => HomeScreen(),
        SearchScreen.routeName :(_) => SearchScreen(),
        SplashScreen.routeName :(_) => SplashScreen(),
      },
      theme: MyTheme.Light,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(LanguageProvider.Language),
      supportedLocales: AppLocalizations.supportedLocales,
      home: AnimatedSplashScreen(
        duration: 4000,
        splashIconSize: double.infinity,
        splash: SplashScreen(),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
  Future<void> getvalueFromShared() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.getString("language") == "en"){
      LanguageProvider.ChangeLanguage("en");
    }else{
      LanguageProvider.ChangeLanguage("ar");
    }
  }

}
