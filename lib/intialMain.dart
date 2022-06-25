import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop/Screens/pageview/onBoarding.dart';
import 'package:shop/blocObserver.dart';
import 'Screens/Login/Loginpage.dart';
import 'Screens/layout/layout_screen.dart';
import 'Shared/SharedPreference/pref.dart';
import 'Shared/global/globals.dart';
import 'app/my_app.dart';

class Intialization {
  static void inital() async {
    cameras = await availableCameras();
    await Firebase.initializeApp();
    await Preference.intial();
    final userid = Preference.get(key: 'id');
    if (userid == null) {
      nextwidget = OnBoarding();
    } else if (userid == 'null') {
      nextwidget = const LoginPage();
    } else {
      nextwidget = const LayoutScreen();
    }
    BlocOverrides.runZoned(
      () {
        runApp(DevicePreview(builder: (context) => const MyApp()));
      },
      blocObserver: MyBlocObserver(),
    );
  }
}
