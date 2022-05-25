// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      return 'Enter Valid password';
    }
  };
  void changeLock() {
    locked = !locked;
    emit(RegisterChangeLock(lock: locked));
    print(state);
  }

  void register() {
    checkRegister = !checkRegister;
    emit(RegisterSuccess(checkRegister: checkRegister));
    Timer(Duration(seconds: 2), () {
      checkRegister = !checkRegister;
      emit(RegisterSuccess(checkRegister: checkRegister));
    });
  }
}
