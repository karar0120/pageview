import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Screens/Splash.dart';
import '../ViewModal/chat_view_model/chat_cubit.dart';
import '../ViewModal/layout_view_model/layout_cubit.dart';
import '../ViewModal/login_view_model/cubit/login_cubit.dart';
import '../ViewModal/register_view_model/cubit/register_cubit.dart';
import '../ViewModal/search_view_model/search_cubit.dart';
import '../ViewModal/setting_view_model/setting_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => RegisterCubit()),
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context)=> LayoutCubit()),
        BlocProvider(create: (BuildContext context)=> ChatCubit()),
        BlocProvider(create: (BuildContext context)=> SearchCubit()),
        BlocProvider(create: (BuildContext context)=> SettingCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'jannah', primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        home: const Splash(),
      ),
    );
  }
}
