import 'package:flutter/material.dart';
import 'Screens/onBoarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'jannah'
      ),
      debugShowCheckedModeBanner: false,
        home: OnBoarding(),
    );
  }
}
