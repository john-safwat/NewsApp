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
          color: Colors.red,
          width: MediaQ.width,
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search_rounded),
                onPressed: (){

                },
              )
            ),
          )
        ),
      ),
    );
  }
}
