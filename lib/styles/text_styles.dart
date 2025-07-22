import 'package:flutter/material.dart';
import 'package:job_tracker/styles/app_sizes.dart';

import 'app_colors.dart';

class TextStyles {
  static TextStyle regularInterFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle mediumInterFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle boldInterFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle extraBoldInterFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle blackInterFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle regularOpenSansFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      fontFamily: 'OpenSans',
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w400,
    );
  }
}
