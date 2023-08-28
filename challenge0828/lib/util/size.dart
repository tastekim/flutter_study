import 'package:flutter/material.dart';


/// ipohone 13 mini viewport
class SizeConfig {
  BuildContext context;

  SizeConfig(this.context);

  double width(double number) {
    return number * (MediaQuery.of(context).size.width / 360);
  }

  // double height(double number) {
  //   return number * (MediaQuery.of(context).size.height / 780);
  // }
}
