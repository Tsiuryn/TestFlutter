import 'dart:ui';

import 'package:flutter/material.dart';
import 'constants.dart';

class CalcBtnStyle {
  Color backgroundColor;
  Color strokeColor;
  Color rippleColor;
  double strokeWidth;
  double cornerRadius;
  TextStyle mainTextStyle;
  TextStyle secondTextStyle;

  CalcBtnStyle(
      {Color? backgroundColor,
         Color? strokeColor,
         double? strokeWidth,
         double? cornerRadius,
         TextStyle? mainTextStyle,
         TextStyle? secondTextStyle,
         Color? rippleColor})
      : this.backgroundColor = backgroundColor ?? Colors.black45,
        this.strokeColor = strokeColor ?? Colors.black,
        this.strokeWidth = strokeWidth ?? 1,
        this.rippleColor = rippleColor ?? Colors.blueGrey,
        this.mainTextStyle = mainTextStyle ?? kMainTS,
        this.secondTextStyle = secondTextStyle ?? kSecondTS,
        this.cornerRadius = cornerRadius ?? 4;
}