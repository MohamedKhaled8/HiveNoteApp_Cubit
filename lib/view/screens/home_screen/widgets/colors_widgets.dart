import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';
import 'package:dbhivelearn/controller/write_data_cubit/cubit/write_data_cubit.dart';

class ColorsWidgets extends StatelessWidget {
  final int activeColorCode;

  const ColorsWidgets({
    Key? key,
    required this.activeColorCode,
  }) : super(key: key);

  final List<int> _colorCodes = const [
    0XFF4A47A3,
    0xFF8c7B93,
    0xFF892CDC,
    0xFFBC6FF1,
    0xFF4ABC4,
    0xFFC70039,
    0xFF8FBC8F,
    0xFFA8072,
    0xFF4D4C7D
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => _getItemsDesign(index, context),
          separatorBuilder: (context, index) => SizedBox(
                width: 6.w,
              ),
          itemCount: _colorCodes.length),
    );
  }

  Widget _getItemsDesign(int index, BuildContext context) {
    return InkWell(
      onTap: () =>
          WriteDataCubit.get(context).updateColorCode(_colorCodes[index]),
      child: Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
              border: activeColorCode == _colorCodes[index]
                  ? Border.all(color: ColorManger.white, width: 2.w)
                  : null,
              shape: BoxShape.circle,
              color: Color(_colorCodes[index])),
          child: activeColorCode == _colorCodes[index]
              ? const Center(
                  child: Icon(
                    Icons.done,
                    color: ColorManger.white,
                  ),
                )
              : null),
    );
  }
}
