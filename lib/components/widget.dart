import 'package:flutter/material.dart';

//screen size
SizedBox gapH(double value) => SizedBox(height: value);
SizedBox gapW(double value) => SizedBox(width: value);
screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

// Custom Text
Text customTxt(
  String text,
  double size,
  Color clr,
  FontWeight weight,
) {
  return Text(
    text,
    style: TextStyle(
        color: clr, fontSize: size, fontWeight: weight, fontFamily: "Roboto"),
  );
}
