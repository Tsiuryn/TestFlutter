import 'dart:ui';
import 'package:flutter/material.dart';

class L10n {
  static final all = [const Locale('en'), const Locale('ru')];

  static String getFlag(String code) {
    switch (code) {
      case 'ru':
        return '🇷🇺'; // mac os: command+control+space windows: Windows + <;>

      case 'en':
      default:
        return '🇺🇸';
    }
  }
}
