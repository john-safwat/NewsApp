import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = 'search par';

  TextEditingController searchControllor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var MediaQ = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        leadingWidth: 0,
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white
          ),
          width: MediaQ.width,
          child: TextFormField(
            onChanged: (input){

            },
            cursorColor: Theme.of(context).primaryColor,
            style: TextStyle(
              color: Theme.of(context).primaryColor
            ),
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: Icon(Icons.close_rounded , color: Theme.of(context).primaryColor),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.search_rounded , color: Theme.of(context).primaryColor,),
                onPressed: (){
                },
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1000),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2 ,
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1000),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2 ,
                  style: BorderStyle.solid,
                ),
              ),
              focusColor: Theme.of(context).primaryColor,
              contentPadding: const EdgeInsets.all(0),
              hintText: "Search Article",
              hintStyle: TextStyle(
                color: Theme.of(context).primaryColor
              ),

            ),
          )
        ),
      ),
    );
  }
}
