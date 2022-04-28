// ignore_for_file: unnecessary_import, unnecessary_string_interpolations, non_constant_identifier_names, prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigatorPushAndRemove(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false);

void navigatorPush(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

Widget texrform(
        {required TextEditingController controller,
        required IconData prefix_icon,
        required String label,
        double? paddingicon,
        double? paddingtext,
        required TextInputType keyborad_type,
        required FormFieldValidator<String> handle_error,
        bool? ispassword,
        Widget? suffix_icon,
        double? fontsize}) =>
    Padding(
      padding: EdgeInsets.all(paddingtext ?? 10.0),
      child: TextFormField(
        controller: controller,
        obscureText: ispassword ?? false,
        keyboardType: keyborad_type,
        validator: handle_error,
        style: TextStyle(fontSize: fontsize),

        // ignore: prefer_const_constructors
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingicon ?? 0),
              child: Icon(
                prefix_icon,
                size: fontsize,
              ),
            ),

            // hintText: 'Email',
            suffixIcon: suffix_icon,
            label: Text(
              '$label',
              style: TextStyle(fontSize: fontsize),
            ),
            // border: InputBorder.none
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );

Widget logo_image({double? height, BoxFit? fit}) => Container(
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/spalsh.jpg'),
              fit: fit ?? BoxFit.fitWidth)),
    );

Widget button(
    {required Function()? onPressed,
    required String text,
    double? fontsize,
    double? padding}) {
  return Padding(
    padding: EdgeInsets.all(padding ?? 10.0),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
              colors: const [Color(0xFFFF247881), Color(0xFF30AADD)])),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          '$text',
          style: TextStyle(fontSize: fontsize, color: Color(0xFFFAFAFA)),
        ),
      ),
    ),
  );
}
