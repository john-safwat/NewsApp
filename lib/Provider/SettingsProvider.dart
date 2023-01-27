import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String Language = 'ar';
  void ChangeLanguage (String NewLocal) async{
    if (NewLocal == Language){return;}
    final pref = await SharedPreferences.getInstance();
    Language = NewLocal ;
    await pref.setString("language", Language );
    notifyListeners();
  }
}