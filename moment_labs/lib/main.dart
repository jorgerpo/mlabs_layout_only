import 'package:flutter/material.dart';
import 'config/fake_states.dart';
import 'utils/app_constants.dart';
import './views/homepage.dart';
import './views/product.dart';
import 'package:get/get.dart';
import 'views/splash.dart';
import './utils/loginWithFacebook.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moments Lab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(title: 'Moments Lab'),
      //home: ProductScreen(),
      home: LoginWithFacebook(),
      //home: SplashPage(),
    );
  }
}
