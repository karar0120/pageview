// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Screens/Register/wrap.dart';

import '../../ViewModal/register_view_model/cubit/register_cubit.dart';


class Registeration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registercubit = context.watch<RegisterCubit>();

    return WrapRegister.get(registercubit: registercubit);
  }
}
