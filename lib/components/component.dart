import 'package:flutter/material.dart';
import 'package:ui/constants/colors.dart';

Widget clickButton({
  required String text,
  required Color textColor,
  required Color backgroundColor,
  required double width,
  Function? function,
}) {
  return Container(
    width: width,
    child: SizedBox(
      height: 40,
      //width:200,
      child: ElevatedButton(
        onPressed: () => function!(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29),
            ),
          ),
        ),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    ),
  );
}

void navigateTo(context, Widget widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

Widget defaultTextFormField({
  required String text,
  required IconData prefixIcon,
  IconData? suffixIcon,
  double circular = 29,
  bool isPassword = false,
  required double width,
  double height = 50,
  Color backgroundColor = primaryLightColor,
  Function? changePass,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(circular),
    ),
    child: TextFormField(
      obscureText: isPassword,
      maxLines: 1,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.none,
          ),
        ),
        labelStyle: const TextStyle(
          color: primaryColor,
        ),
        labelText: text,
        prefixIcon: Icon(
          prefixIcon,
          size: 20,
          color: primaryColor,
        ),
        suffixIcon: IconButton(
            onPressed: () {

              changePass!();
            },
            icon: Icon(
              suffixIcon,
              size: 20,
              color: primaryColor,
            )),
        border: InputBorder.none, // the line
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
