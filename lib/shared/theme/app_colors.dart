import 'package:flutter/material.dart';

abstract class AppColors {
  static const primarySwatch = Color.fromRGBO(230, 245, 251, 1);
  static const secondarySwatch = Color.fromRGBO(236, 214, 255, 1);

  static const brilhantPrimarySwatch = Color.fromRGBO(145, 211, 237, 1);
  static const brilhantSecondarySwatch = Color.fromRGBO(255, 128, 203, 1);
  static const brilhantSecondarySwatchFocused =
      Color.fromRGBO(255, 128, 100, 1);

  static const surface = Color.fromRGBO(42, 42, 42, 1);
  static const surfaceFocused = Color.fromRGBO(61, 61, 61, 1);

  static const white = Color.fromRGBO(255, 255, 255, 1);

  static const error = Color.fromRGBO(255, 94, 71, 1);
  static const success = Color.fromRGBO(71, 185, 138, 1);

  static const textPrimary = Color.fromRGBO(255, 255, 255, 1);
  static const textSecondary = Color.fromRGBO(149, 149, 149, 1);

  static const shadowSoft = Color.fromRGBO(0, 0, 0, .3);
}
