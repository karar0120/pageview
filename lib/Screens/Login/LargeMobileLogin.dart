// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop/Shared/constaness/constanesApp.dart';

import '../../ViewModal/login_view_model/cubit/login_cubit.dart';
import '../Register/registeration.dart';

class LargeMobileLogin extends StatelessWidget {
  LoginCubit logincubit;
  BoxConstraints constraints;
  // ignore: use_key_in_widget_constructors
  LargeMobileLogin({required this.constraints, required this.logincubit});
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
              logo_image(height: constraints.maxHeight / 2, fit: BoxFit.fill),
              texrform(
                  controller: logincubit.user_name,
                  fontsize: 20,
                  handle_error: logincubit.emailValidation,
                  keyborad_type: TextInputType.emailAddress,
                  prefix_icon: Icons.email,
                  label: 'Username or Email'),
              texrform(
                  controller: logincubit.password,
                  fontsize: 20,
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
                      child: Text('Sign up', style: TextStyle(fontSize: 20)))
                ],
              ),
              button(
                  fontsize: 20,
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