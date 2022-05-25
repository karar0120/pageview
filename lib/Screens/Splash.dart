// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop/Shared/constaness/constanesApp.dart';

import 'Login/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      navigatorPush(context, Login());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, body: SafeArea(child: logo_image()));
  }
}
