import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/custom_body_dialoge_filter.dart';

class FilterDialoge extends StatelessWidget {
  const FilterDialoge({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorManger.black,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: const CustomBodyDialogeFilter(),
      ),
    );
  }
}
