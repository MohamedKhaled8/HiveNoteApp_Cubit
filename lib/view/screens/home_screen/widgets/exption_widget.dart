import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';

class ExceptionWidget extends StatelessWidget {
  final IconData iconData;
  final String message;
  const ExceptionWidget({
    Key? key,
    required this.iconData,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          color: ColorManger.white,
          size: 50.h,
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: ColorManger.white, fontSize: 22.sp),
        )
      ],
    );
  }
}