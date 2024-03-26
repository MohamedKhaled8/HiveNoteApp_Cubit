import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/filter_dialoge.dart';

class CustomFilterDialogeButton extends StatelessWidget {
  const CustomFilterDialogeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const FilterDialoge(),
        );
      },
      child: CircleAvatar(
        radius: 18.h,
        backgroundColor: ColorManger.white,
        child: const Icon(
          Icons.filter_list,
          color: ColorManger.black,
        ),
      ),
    );
  }
}
