import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Screens/Splash.dart';
import 'package:shop/ViewModal/register/cubit/register_cubit.dart';
import 'ViewModal/login/cubit/login_cubit.dart';
import 'blocObserver.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(DevicePreview(builder: (context) => const MyApp()));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit())
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'jannah', primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        home: const Splash(),
      ),
    );
  }
}
