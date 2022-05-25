// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shop/Shared/constaness/constanesApp.dart';
import '../../ViewModal/register_view_model/cubit/register_cubit.dart';
import '../Login/login.dart';

class SmallMobileregister extends StatelessWidget {
  RegisterCubit registercubit;
  BoxConstraints constraints;
  SmallMobileregister({required this.constraints, required this.registercubit});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: registercubit.formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                logo_image(
                    height: constraints.maxHeight / 3.5, fit: BoxFit.fill),
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
                          navigatorPushAndRemove(context, Login());
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
