import 'package:flutter/material.dart';

class ChangeThemeMode {
  ChangeThemeMode({
    required this.ctx,
  });
  final ThemeData ctx;

  Color fontSwitch() {
    return ctx.brightness == Brightness.light ? Colors.black : Colors.white;
  }

  Color bgSwitch() {
    return ctx.brightness == Brightness.light ? Colors.white : Colors.black;
  }
}
