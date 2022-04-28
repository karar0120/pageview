// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop/Modal/onBoarding.dart';
import 'package:shop/Screens/LoginScreen/login.dart';
import 'package:shop/Shared/constaness/constanesApp.dart';
import 'package:shop/ViewModal/onBoarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  var onBoardingView = OnBoardingView();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: GatAppBar(),
      ),
      body: GetBody(),
    );
  }

  Widget GatAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: [
        TextButton(
            onPressed: () {
              navigatorPushAndRemove(context, Login());
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "SKIP",
                style: TextStyle(color: Colors.indigo),
              ),
            ))
      ],
    );
  }

  Widget GetBody() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                onPageChanged: (int index) {
                  setState(() {
                    onBoardingView.onChangePageView(index);
                  });
                },
                controller: onBoardingView.pagecontroller,
                physics: BouncingScrollPhysics(),
                itemCount: onBoardingView.contentOnBoarding.length,
                itemBuilder: (context, index) =>
                    OnBoardingItem(onBoardingView.contentOnBoarding[index])),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SmoothPageIndicator(
                controller: onBoardingView.pagecontroller,
                count: onBoardingView.contentOnBoarding.length,
                effect: ExpandingDotsEffect(
                    expansionFactor: 4,
                    spacing: 8.0,
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.indigo),
              ),
              Spacer(),
              FloatingActionButton(
                  backgroundColor: Colors.indigo,
                  onPressed: () {
                    if (onBoardingView.isLastPageView) {
                      navigatorPushAndRemove(context, Login());
                    } else {
                      onBoardingView.NextPageView();
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios)),
            ],
          )
        ],
      ),
    );
  }

  Widget OnBoardingItem(ContentOnBoarding data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                '${data.image}',
              ),
            )),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "${data.title}",
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${data.Subtitle}',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
