import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'color_converter.dart';

class MyTheme {
  static Color primaryColor = HexColor.fromHex("#E45B3F");
  static Color secondaryColor = HexColor.fromHex("#737373");
  static Color backgroundColor = HexColor.fromHex("#EEEEEE");

  static final myThemeData = ThemeData(
      primaryColor: primaryColor.toMaterialColor(),
      backgroundColor: backgroundColor.toMaterialColor(),
      accentColor: secondaryColor.toMaterialColor(),
      fontFamily: "IranYekan");
}
