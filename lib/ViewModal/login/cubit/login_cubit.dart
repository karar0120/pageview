// ignore_for_file: non_constant_identifier_names, unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

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
      return 'Enter Valid password';
    }
  };
  void changeLock() {
    locked = !locked;
    emit(LoginChangeLock(lock: locked));
    print(state);
  }

  void login() {
    checklogin = !checklogin;
    emit(LoginSuccess(checklogin: checklogin));
    Timer(Duration(seconds: 2), () {
      checklogin = !checklogin;
      emit(LoginSuccess(checklogin: checklogin));
    });
  }
}
