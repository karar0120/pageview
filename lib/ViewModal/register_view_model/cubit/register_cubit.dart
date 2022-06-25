// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Firebase/firebase.dart';
import 'package:shop/Model/user.dart';
import 'package:shop/Screens/layout/layout_screen.dart';
import 'package:shop/Shared/SharedPreference/pref.dart';
import 'package:shop/Shared/constaness/constanesApp.dart';
import 'package:shop/Shared/global/globals.dart';
import 'package:shop/ViewModal/register_view_model/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterIntialState());
  final email = TextEditingController();
  final phone = TextEditingController();
  final user_name = TextEditingController();
  final password = TextEditingController();
  bool locked = true;
  bool checkRegister = true;
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
  final phoneValidation = (data) {
    if (data.isEmpty) {
      return 'Enter your phone';
    } else if (data.length != 11) {
      return 'Enter only 11 number ';
    }
  };
  // ignore: prefer_function_declarations_over_variables
  final nameValidation = (data) {
    if (data.isEmpty) {
      return 'Enter your phone';
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
    emit(RegisterChangeLock(lock: locked));
    print(state);
  }

  void register({required BuildContext context}) async {
    checkRegister = !checkRegister;
    emit(RegisterLoading(checkRegister: checkRegister));
    final userCredential =
        await FirebaseData().signUp(email: email.text, password: password.text);
    if (userCredential is String) {
      showmessage(context: context, message: userCredential);
      checkRegister = !checkRegister;
      emit(RegisterFail(checkRegister: checkRegister));
      return;
    }
    showmessage(context: context, message: 'Success Login');
    User user = userCredential.user;
    UserModel userInfo = UserModel(
      imagePath: 'none',
      uId: user.uid,
      name: user_name.text,
      phone: phone.text,
      email: email.text,
      about: 'none',
    );
    await FirebaseData().adduser(userInfo);
    userModel = await FirebaseData().getUser(uid: user.uid);
    Preference.put(key: 'id', value: userModel.uId!);
    checkRegister = !checkRegister;
    phone.clear();
    email.clear();
    user_name.clear();
    password.clear();
    emit(RegisterSuccess(checkRegister: checkRegister));
    navigatorPush(context, LayoutScreen());
  }

  void registerwithgoogle({required BuildContext context}) async {
    emit(RegisterLoading(checkRegister: checkRegister));
    final userCredential = await FirebaseData().signUp_WithGoogle();
    if (userCredential is String) {
      showmessage(context: context, message: userCredential);
      return;
    }
    showmessage(context: context, message: 'Success Login');
    User user = userCredential.user;
    UserModel userInfo = UserModel(
      imagePath: user.photoURL,
      uId: user.uid,
      name: user.displayName,
      phone: user.phoneNumber,
      email: user.email,
      about: 'none',
    );
    await FirebaseData().adduser(userInfo);
    userModel = await FirebaseData().getUser(uid: user.uid);
    Preference.put(key: 'id', value: userModel.uId!);
    emit(RegisterSuccess(checkRegister: checkRegister));
    navigatorPush(context, LayoutScreen());
  }
}
