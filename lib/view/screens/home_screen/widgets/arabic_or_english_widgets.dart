import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/custom_container_design.dart';


class ArabicOrEnglishWidget extends StatelessWidget {
  final int colorCode;
  final bool arabicIsSelected;

  const ArabicOrEnglishWidget({
    Key? key,
    required this.colorCode,
    required this.arabicIsSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomContainerDesign(
          isArabic: true,
          arabicIsSelected: arabicIsSelected,
          colorCode: colorCode,
        ),
        SizedBox(
          width: 10.w,
        ),
        CustomContainerDesign(
          isArabic: false,
          arabicIsSelected: arabicIsSelected,
          colorCode: colorCode,
        ),
      ],
    );
  }
}

