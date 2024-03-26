import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';

abstract class ThemeManger {
  static ThemeData getTheme() {
    return ThemeData(
        scaffoldBackgroundColor: ColorManger.black,
        appBarTheme:  AppBarTheme(
            centerTitle: true,
            elevation: 0.0,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21.sp
            ),
            color: ColorManger.black,
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: ColorManger.black)));
  }
}
