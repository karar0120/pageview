// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

import '../../Model/pageview_model/onBoarding.dart';

class OnBoardingView {
  List<ContentOnBoarding> contentOnBoarding = [
    ContentOnBoarding(
        image: 'assets/images/shop2.png',
        title: 'Discover',
        Subtitle:
            "We are the first application that helps you communicate and translate sign language easily"),
    ContentOnBoarding(
        image: 'assets/images/shop1.png',
        title: 'Enjoy your Journey',
        Subtitle: 'Get high Security for your personal information '),
    ContentOnBoarding(
        image: 'assets/images/shop3.png',
        title: 'Start Now',
        Subtitle: 'What are you waiting for to start your journey now?\n '),
  ];

  var pagecontroller = PageController();

  // ignore: non_constant_identifier_names
  bool isLastPageView = false;

  void onChangePageView(int index) {
    if (index == contentOnBoarding.length - 1) {
      isLastPageView = true;
    } else {
      isLastPageView = false;
    }
  }

  void NextPageView() {
    pagecontroller.nextPage(
        duration: Duration(milliseconds: 750),
        curve: Curves.fastLinearToSlowEaseIn);
  }
}
