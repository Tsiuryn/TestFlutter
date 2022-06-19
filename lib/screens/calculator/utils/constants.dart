import 'dart:ui';

import 'package:flutter/material.dart';

import 'btn_style.dart';

const TextStyle kAddTS = TextStyle(
  color: Colors.white,
  fontFamily: 'Amalia',
  fontWeight: FontWeight.w500,
  fontSize: 40,
);

const TextStyle kMainTS = TextStyle(
  color: Colors.white,
  fontFamily: 'Amalia',
  fontWeight: FontWeight.w500,
  fontSize: 25,
);

const TextStyle kSecondTS = TextStyle(
  color: Colors.greenAccent,
  fontFamily: 'Amalia',
  fontWeight: FontWeight.w200,
  fontSize: 15,
);

final CalcBtnStyle kStyleBtnFunction = CalcBtnStyle(
    mainTextStyle: kMainTS.copyWith(color: Colors.blueAccent),
    cornerRadius: 20);

final CalcBtnStyle kStyleBtnSecondFunction = CalcBtnStyle(cornerRadius: 20);

final CalcBtnStyle kStyleBtnNumb = CalcBtnStyle();

final CalcBtnStyle kStyleBtnDel = CalcBtnStyle(
    mainTextStyle: kMainTS.copyWith(
        color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold));
