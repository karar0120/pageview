// ignore_for_file: non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/Firebase/firebase.dart';
import 'package:shop/Screens/layout/layout_screen.dart';
import 'package:shop/Shared/SharedPreference/pref.dart';
import 'package:shop/Shared/constaness/constanesApp.dart';
import 'package:shop/Shared/global/globals.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final user_name = TextEditingController();
  final password = TextEditingController();
  bool locked = true;
  bool checklogin = true;
  // ignore: annotate_overrides
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // ignore: prefer_function_declarations_over_variables
  final emailValidation = (data) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(data);

    if (!emailValid || data.isEmpty) {
      return 'Enter Valid password';
    }
  };

  // ignore: prefer_function_declarations_over_variables
  final passwordValidation = (data) {
    bool passwordValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-6])(?=.*?[!@#\$&*~]).{6,}$')
            .hasMatch(data);
    if (!passwordValid || data.isEmpty) {
      return 'Minimum 1 Upper case\nMinimum 1 lowercase\nMinimum 1 Numeric Number\nMinimum 1 Special Character';
    }
  };
  void changeLock() {
    locked = !locked;
    emit(LoginChangeLock(lock: locked));
    print(state);
  }

  void login(context) async {
    checklogin = !checklogin;
    emit(LoginLoading(checklogin: checklogin));
    final userCredential = await FirebaseData()
        .signin(email: user_name.text, password: password.text);
    if (userCredential is String) {
      showmessage(context: context, message: userCredential);
      checklogin = !checklogin;
      emit(LoginFail(checklogin: checklogin));
      return;
    }
    userModel = await FirebaseData().getUser(uid: userCredential.uid);
    Preference.put(key: 'id', value: userModel.uId!);
    showmessage(context: context, message: 'Success Login');
    checklogin = !checklogin;
    user_name.clear();
    password.clear();
    emit(LoginSuccess(checklogin: checklogin));
    navigatorPush(context, LayoutScreen());
  }

  void logingoogle(context) async {
    emit(LoginLoading(checklogin: checklogin));
    final userCredential = await FirebaseData().signIn_WithGoogle();
    if (userCredential is String) {
      showmessage(context: context, message: userCredential);
      return;
    }

    User userinfo = userCredential.user;
    userModel = await FirebaseData().getUser(uid: userinfo.uid);
    Preference.put(key: 'id', value: userModel.uId!);
    showmessage(context: context, message: 'Success Login');
    emit(LoginSuccess(checklogin: checklogin));
    navigatorPush(context, LayoutScreen());
  }
}
