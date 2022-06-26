// ignore_for_file: unnecessary_import, unnecessary_string_interpolations, non_constant_identifier_names, prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void navigatorPushAndRemove(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false);

void navigatorPush(context, widget) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (BuildContext context) => widget));

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
        style: TextStyle(fontSize: fontsize, color: Color(0xFFfff5f4)),

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
              style: TextStyle(fontSize: fontsize, color: Color(0xFFfff5f4)),
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
              image: AssetImage('assets/images/spl.png'),
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
              colors: const [Color(0xFF0c2442), Color(0xFF4f7492)])),
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

Widget backgroundcolor() {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: const [Color(0xFF0c2442), Color(0xFF4f7492)])),
  );
}

void Util(BuildContext context) {
  ScreenUtil.init(context, minTextAdapt: true, designSize: Size(360, 1880));
}

void showmessage({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 1),
  ));
}

const defaul_user_image =
    'https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg?size=626&ext=jpg&ga=GA1.2.1407711504.1647202528';

const defaul_cover_image =
    'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg?size=626&ext=jpg&ga=GA1.2.1407711504.1647202528';
const default_about = 'this your bio ...';
