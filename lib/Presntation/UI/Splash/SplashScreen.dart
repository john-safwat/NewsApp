import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/pattern.png'),
          fit: BoxFit.cover
        ),
        color: Colors.white
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: Image.asset("assets/logo.png"),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/routname.png"),
            ),
          ],
        ),
      ),
    );
  }
}
