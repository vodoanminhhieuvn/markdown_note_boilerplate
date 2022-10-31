import 'package:flutter/material.dart';

class AppTypography {
  TextStyle? s20w700style({Color? color, TextStyle? style}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: color,
    ).merge(style);
  }

  TextStyle? s18w700style({Color? color, TextStyle? style}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: color,
    ).merge(style);
  }

  TextStyle? s16w500style({Color? color, TextStyle? style}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
    ).merge(style);
  }

  TextStyle? s15w700style({Color? color, TextStyle? style}) {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: color,
    ).merge(style);
  }

  TextStyle? s14w500style({Color? color, TextStyle? style}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color,
    ).merge(style);
  }

  TextStyle? s12w500style({Color? color, TextStyle? style}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color,
    ).merge(style);
  }
}
