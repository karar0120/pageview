import 'package:flutter/cupertino.dart';
import 'package:shop/ViewModal/login/cubit/login_cubit.dart';

import 'LargeMobileLogin.dart';
import 'LargeTabletLogin.dart';
import 'MediumMobileLogin.dart';
import 'SmallMediumTabletLogin.dart';
import 'SmallMobileLogin.dart';

class WrapLogin {
  static Widget get({required LoginCubit logincubit}) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 400) {
        return SmallMobileLogin(
          logincubit: logincubit,
          constraints: constraints,
        );
      } else if (constraints.maxWidth <= 800 && constraints.maxHeight <= 800) {
        return MediumMobileLogin(
            constraints: constraints, logincubit: logincubit);
      } else if (constraints.maxWidth < 800 && constraints.maxHeight >= 800) {
        return LargeMobileLogin(
            constraints: constraints, logincubit: logincubit);
      } else if (constraints.maxWidth <= 1024) {
        return SmallMediumTabletLogin(
            constraints: constraints, logincubit: logincubit);
      } else {
        return LargeTabletLogin(
            constraints: constraints, logincubit: logincubit);
      }
    });
  }
}
