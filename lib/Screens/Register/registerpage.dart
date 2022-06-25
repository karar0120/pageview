// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/Screens/Login/Loginpage.dart';
import 'package:shop/Shared/constaness/constanesApp.dart';
import '../../ViewModal/register_view_model/cubit/register_cubit.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage();
  @override
  Widget build(BuildContext context) {
    RegisterCubit registercubit = context.watch<RegisterCubit>();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    Util(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: registercubit.formkey,
          child: Stack(
            children: [
              backgroundcolor(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    logo_image(height: h / 5, fit: BoxFit.fill),
                    texrform(
                        paddingtext: 5,
                        handle_error: registercubit.nameValidation,
                        controller: registercubit.user_name,
                        keyborad_type: TextInputType.text,
                        prefix_icon: Icons.person,
                        label: 'Name'),
                    texrform(
                        paddingtext: 5,
                        handle_error: registercubit.emailValidation,
                        controller: registercubit.email,
                        keyborad_type: TextInputType.emailAddress,
                        prefix_icon: Icons.email,
                        label: 'Email'),
                    texrform(
                      paddingtext: 5,
                      handle_error: registercubit.phoneValidation,
                      controller: registercubit.phone,
                      prefix_icon: Icons.phone,
                      label: 'Phone ',
                      keyborad_type: TextInputType.number,
                    ),
                    texrform(
                        paddingtext: 5,
                        handle_error: registercubit.passwordValidation,
                        controller: registercubit.password,
                        keyborad_type: TextInputType.text,
                        ispassword: registercubit.locked,
                        suffix_icon: IconButton(
                            onPressed: () {
                              registercubit.changeLock();
                            },
                            icon: Icon(registercubit.locked
                                ? Icons.lock
                                : Icons.lock_open)),
                        prefix_icon: Icons.keyboard,
                        label: 'Password'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have account'),
                        TextButton(
                            onPressed: () {
                              navigatorPushAndRemove(context, LoginPage());
                            },
                            child: Text('Sign in'))
                      ],
                    ),
                    button(
                        padding: 0,
                        onPressed: registercubit.checkRegister
                            ? () {
                                if (registercubit.formkey.currentState!
                                    .validate()) {
                                  registercubit.register(context: context);
                                }
                              }
                            : null,
                        text: registercubit.checkRegister
                            ? 'Register'
                            : 'Loading....'),
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
                          registercubit.registerwithgoogle(context: context);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
