import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';


class AddWordSimilarButtonDetailesScreen extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  const AddWordSimilarButtonDetailesScreen({
    Key? key,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50.w,
        height: 30.h,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
        child: const Icon(
          Icons.add,
          color: ColorManger.black,
        ),
      ),
    );
  }
}
