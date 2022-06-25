// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, unnecessary_import, unused_local_variable, overridden_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/Screens/Register/registerpage.dart';
import 'package:shop/Shared/constaness/constanesApp.dart';

import '../../ViewModal/login_view_model/cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();
  @override
  Widget build(BuildContext context) {
    LoginCubit logincubit = context.watch<LoginCubit>();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    Util(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
            key: logincubit.formkey,
            child: Stack(
              children: [
                backgroundcolor(),
                ListView(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    logo_image(height: h / 3, fit: BoxFit.fill),
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
                              navigatorPushAndRemove(context, RegisterPage());
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
                                if (logincubit.formkey.currentState!
                                    .validate()) {
                                  logincubit.login(context);
                                }
                              }
                            : null,
                        text: logincubit.checklogin ? 'Login' : 'Loading....'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width / 3,
                          height: ScreenUtil().setHeight(3),
                          color: Colors.grey.shade400,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'or',
                            style: TextStyle(fontSize: ScreenUtil().setSp(50)),
                          ),
                        ),
                        Container(
                          width: size.width / 3,
                          height: ScreenUtil().setHeight(3),
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w / 5,
                      ),
                      child: InkWell(
                        onTap: () {
                          logincubit.logingoogle(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.5,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(colors: const [
                                Color(0xFF0c2442),
                                Color(0xFF4f7492)
                              ])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Image.asset(
                                'assets/images/Layer2.png',
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Sign in with Google',
                                style: TextStyle(color: Color(0xFFFAFAFA)),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
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