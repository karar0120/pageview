import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void NavigatorPushAndRemove(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false);

void NavigatorPush(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
