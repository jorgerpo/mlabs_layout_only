import 'package:flutter/material.dart';
import 'config/fake_states.dart';
import 'utils/app_constants.dart';
import 'package:MomentLabs/views/homepage.dart';
import 'package:MomentLabs/views/product.dart';
import 'package:get/get.dart';

void main() {
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
      home: ProductScreen(),
    );
  }
}
