// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:it_solution_technical_task/components/color.dart';

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

// For paragraph Text
Text customParaTxt(
  String txt,
  double size,
  Color clr,
  FontWeight weight,
  TextAlign align,
) {
  return Text(
    txt,
    textAlign: align,
    style: TextStyle(
        color: clr, fontSize: size, fontWeight: weight, fontFamily: "Roboto"),
  );
}

// Custom TextFiled

customTextField(txt, wt, txtsz) {
  return SizedBox(
    height: 40,
    width: wt,
    child: TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: white,
        contentPadding: const EdgeInsets.all(6),
        hintText: txt,
        hintStyle: TextStyle(
            color: blk55,
            fontSize: txtsz,
            fontWeight: FontWeight.w300,
            fontFamily: 'Roboto'),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              width: 1,
              color: toggrey,
            )),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            width: 1,
            color: toggrey,
          ),
        ),
      ),
    ),
  );
}

// Custom Button
customButton(ht, wt, btnclr, bdrclr, rdus, clk, widget) {
  return MaterialButton(
    elevation: 0.0,
    height: ht,
    minWidth: wt,
    color: btnclr,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(rdus),
        side: BorderSide(color: bdrclr)),
    onPressed: clk,
    child: widget,
  );
}

//Display message
void displayMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: const Duration(milliseconds: 1000),
  ));
}
