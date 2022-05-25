// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, unnecessary_import, unused_local_variable, overridden_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/Shared/constaness/constanesApp.dart';

import '../../ViewModal/login_view_model/cubit/login_cubit.dart';
import '../Register/registeration.dart';


class SmallMobileLogin extends StatelessWidget {
  LoginCubit logincubit;
  BoxConstraints constraints;
  SmallMobileLogin({required this.constraints, required this.logincubit});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: logincubit.formkey,
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              logo_image(height: constraints.maxHeight / 3, fit: BoxFit.fill),
              texrform(
                  controller: logincubit.user_name,
                  handle_error: logincubit.emailValidation,
                  keyborad_type: TextInputType.emailAddress,
                  prefix_icon: Icons.email,
                  label: 'Username or Email'),
              texrform(
                  controller: logincubit.password,
                  handle_error: logincubit.passwordValidation,
                  keyborad_type: TextInputType.text,
                  suffix_icon: IconButton(
                      onPressed: () {
                        logincubit.changeLock();
                      },
                      icon: logincubit.locked
                          ? Icon(Icons.lock)
                          : Icon(Icons.lock_open)),
                  ispassword: logincubit.locked,
                  prefix_icon: Icons.keyboard,
                  label: 'Password'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' Don`t have account',
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () {
                        navigatorPushAndRemove(context, Registeration());
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
              button(
                  onPressed: logincubit.checklogin
                      ? () {
                          if (logincubit.formkey.currentState!.validate()) {
                            logincubit.login(context);
                          }
                        }
                      : null,
                  text: logincubit.checklogin ? 'Login' : 'Loading....')
            ],
          ),
        ),
      ),
    );
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