// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, unnecessary_import, unused_local_variable, overridden_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Screens/Login/wrap.dart';

import '../../ViewModal/login_view_model/cubit/login_cubit.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logincubit = context.watch<LoginCubit>();
    return Scaffold(
        backgroundColor: Colors.white,
        body: WrapLogin.get(logincubit: logincubit));
  }
}

/*
Minimum 1 Upper case
Minimum 1 lowercase
Minimum 1 Numeric Number
Minimum 1 Special Character
Minimum Password size 6  
Common Allow Character ( ! @ # $ & * ~ )
*/ 