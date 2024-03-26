import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';

class CustomFilterField extends StatelessWidget {
  final List<String> labels;
  final List<VoidCallback> onTap;
  final List<bool> conditionOfActivation;
  const CustomFilterField({
    Key? key,
    required this.labels,
    required this.onTap,
    required this.conditionOfActivation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < labels.length; i++)
          InkWell(
            onTap: onTap[i],
            child: Container(
              height: 40.h,
              width: 80.w,
              margin: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ColorManger.white),
                  color: conditionOfActivation[i]
                      ? ColorManger.white
                      : ColorManger.black),
              child: Center(
                child: Text(
                  labels[i],
                  style: TextStyle(
                      color: conditionOfActivation[i]
                          ? ColorManger.black
                          : ColorManger.white),
                ),
              ),
            ),
          )
      ],
    );
  }
}
