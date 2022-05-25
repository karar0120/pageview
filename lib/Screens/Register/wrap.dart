import 'package:flutter/cupertino.dart';
import '../../ViewModal/register_view_model/cubit/register_cubit.dart';
import 'LargeMobileregister.dart';
import 'LargeTabletregister.dart';
import 'MediumMobileregister.dart';
import 'SmallMediumTabletregister.dart';
import 'SmallMobileRegisteration.dart';

class WrapRegister {
  static Widget get({required RegisterCubit registercubit}) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 400) {
        return SmallMobileregister(
          registercubit: registercubit,
          constraints: constraints,
        );
      } else if (constraints.maxWidth <= 800 && constraints.maxHeight <= 800) {
        return MediumMobileregister(
            constraints: constraints, registercubit: registercubit);
      } else if (constraints.maxWidth < 800 && constraints.maxHeight >= 800) {
        return LargeMobileregister(
            constraints: constraints, registercubit: registercubit);
      } else if (constraints.maxWidth <= 1024) {
        return SmallMediumTabletregister(
            constraints: constraints, registercubit: registercubit);
      } else {
        return LargeTabletregister(
            constraints: constraints, registercubit: registercubit);
      }
    });
  }
}
