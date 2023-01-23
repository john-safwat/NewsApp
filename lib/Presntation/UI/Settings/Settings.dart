import 'package:flutter/material.dart';
import 'package:newsapp/Presntation/Theme/mytheme.dart';

class SettingsTap extends StatefulWidget {
  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  var Languages = ['English' , 'Arabic' , 'Spain'];

  var selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Language",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: MyTheme.Gray,
            ),
          ),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
            margin:const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 2 , color: Theme.of(context).primaryColor,),
              borderRadius: BorderRadius.circular(10)
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedLanguage,
                  dropdownColor: Colors.white,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20
                  ),
                  items: Languages.map<DropdownMenuItem<String>>((String Value) => DropdownMenuItem<String>(
                      value: Value,
                      child: Text(Value),
                  )).toList(),
                  onChanged: (value) {
                    selectedLanguage = value!;
                    setState(() {

                    });
                  },
                ),
            ),
          )
        ],
      ),
    );
  }
}
