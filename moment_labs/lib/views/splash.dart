import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'login.dart' as login;
import 'package:Mlabs/views/walkthrough.dart' as wt;

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        title: new Text(
          '...',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        image: new Image.asset('assets/logo01.png'),
        photoSize: 180.0,
        backgroundColor: Color.fromRGBO(209, 182, 217, 1),
        gradientBackground: new LinearGradient(
            colors: [Colors.purple, Colors.pink.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        loaderColor: Colors.black,
        //navigateAfterSeconds: MyHomePage(),
        //navigateAfterSeconds: login.LoginConFacebook());
        navigateAfterSeconds: wt.Walkthrough());
  }
}
