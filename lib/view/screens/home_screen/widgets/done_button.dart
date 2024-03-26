import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';

class DoneButton extends StatelessWidget {
  final int colorCode;
  final VoidCallback onTap;
  const DoneButton({
    Key? key,
    required this.colorCode,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 35.h,
          width: 50.w,
          decoration: BoxDecoration(
              color: ColorManger.white,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              "Done",
              style: TextStyle(
                color: Color(colorCode),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
