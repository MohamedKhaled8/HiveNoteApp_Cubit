import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';
import 'package:dbhivelearn/controller/write_data_cubit/cubit/write_data_cubit.dart';

class CustomContainerDesign extends StatelessWidget {
  final bool isArabic;
  final int colorCode;
  final bool arabicIsSelected;
  const CustomContainerDesign({
    Key? key,
    required this.isArabic,
    required this.colorCode,
    required this.arabicIsSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => WriteDataCubit.get(context).updateIsAraic(isArabic),
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
            border: Border.all(width: 2.w, color: ColorManger.white),
            shape: BoxShape.circle,
            color: isArabic == arabicIsSelected
                ? ColorManger.white
                : Color(colorCode)),
        child: Center(
          child: Text(
            isArabic ? "ar" : "en",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: !(isArabic == arabicIsSelected)
                  ? ColorManger.white
                  : Color(colorCode),
            ),
          ),
        ),
      ),
    );
  }
}
