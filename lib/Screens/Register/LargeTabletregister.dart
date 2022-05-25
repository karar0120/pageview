// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Shared/constaness/constanesApp.dart';


import '../../ViewModal/register_view_model/cubit/register_cubit.dart';
import '../Login/login.dart';

class LargeTabletregister extends StatelessWidget {
  RegisterCubit registercubit;
  BoxConstraints constraints;
  LargeTabletregister({required this.constraints, required this.registercubit});
  @override
  Widget build(BuildContext context) {
    final registercubit = context.watch<RegisterCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: registercubit.formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                logo_image(
                    height: constraints.maxHeight / 2.2, fit: BoxFit.contain),
                texrform(
                    fontsize: 60,
                    paddingicon: 20,
                    handle_error: registercubit.nameValidation,
                    controller: registercubit.user_name,
                    keyborad_type: TextInputType.text,
                    prefix_icon: Icons.person,
                    label: 'Name'),
                texrform(
                    fontsize: 60,
                    paddingicon: 20,
                    handle_error: registercubit.emailValidation,
                    controller: registercubit.email,
                    keyborad_type: TextInputType.emailAddress,
                    prefix_icon: Icons.email,
                    label: 'Email'),
                texrform(
                  fontsize: 60,
                  paddingicon: 20,
                  handle_error: registercubit.phoneValidation,
                  controller: registercubit.phone,
                  prefix_icon: Icons.phone,
                  label: 'Phone ',
                  keyborad_type: TextInputType.number,
                ),
                texrform(
                    fontsize: 60,
                    paddingicon: 20,
                    handle_error: registercubit.passwordValidation,
                    controller: registercubit.password,
                    keyborad_type: TextInputType.text,
                    ispassword: registercubit.locked,
                    suffix_icon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: IconButton(
                          onPressed: () {
                            registercubit.changeLock();
                          },
                          icon: registercubit.locked
                              ? Icon(
                                  Icons.lock,
                                  size: 50,
                                )
                              : Icon(Icons.lock_open)),
                    ),
                    prefix_icon: Icons.keyboard,
                    label: 'Password'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have account',
                        style: TextStyle(fontSize: 45)),
                    TextButton(
                        onPressed: () {
                          navigatorPushAndRemove(context, Login());
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 45),
                        ))
                  ],
                ),
                button(
                    fontsize: 60,
                    onPressed: registercubit.checkRegister
                        ? () {
                            if (registercubit.formkey.currentState!
                                .validate()) {
                              registercubit.register();
                            }
                          }
                        : null,
                    text: registercubit.checkRegister
                        ? 'Register'
                        : 'Loading....')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
