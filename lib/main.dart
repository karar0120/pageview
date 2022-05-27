import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocObserver.dart';
import 'package:device_preview/device_preview.dart';
import 'app/my_app.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(DevicePreview(builder: (context) => const MyApp()));
    },
    blocObserver: MyBlocObserver(),
  );
}
