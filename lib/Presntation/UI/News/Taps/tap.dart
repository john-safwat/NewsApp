import 'package:flutter/material.dart';
import 'package:newsapp/Api/Models/SourcesModels/Sources.dart';

class TapButton extends StatelessWidget {
  Sources source ;
  bool is_selected ;
  TapButton (this.source , this.is_selected );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
      decoration: BoxDecoration(
        color: is_selected? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2 , color: Theme.of(context).primaryColor),
      ),
      child: Text(
        source.name!,
        style: TextStyle(
          color: is_selected ? Colors.white : Theme.of(context).primaryColor,
          fontSize: 14
        ),
      ),
    );
  }
}
