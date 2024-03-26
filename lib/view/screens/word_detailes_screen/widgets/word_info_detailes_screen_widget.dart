import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';

class WordInfoDetailesWidget extends StatelessWidget {
  final Color color;
  final String text;
  final bool isArabic;
  final VoidCallback? onPressed;
  const WordInfoDetailesWidget({
    Key? key,
    required this.color,
    required this.text,
    required this.isArabic,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.w),
      margin: EdgeInsets.only(
        bottom: 10.h,
      ),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.h,
            backgroundColor: ColorManger.black,
            child: Text(
              isArabic ? "ar" : "en",
              style: TextStyle(color: color),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  color: ColorManger.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          if (onPressed != null)
            IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.delete,
                  color: ColorManger.black,
                ))
        ],
      ),
    );
  }
}
