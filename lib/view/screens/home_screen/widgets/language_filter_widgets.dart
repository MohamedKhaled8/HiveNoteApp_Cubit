import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';
import 'package:dbhivelearn/controller/read_data_cubit/cubit/read_data_cubit.dart';

class CustomLanguageFilterWidget extends StatelessWidget {
  const CustomLanguageFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit, ReadDataState>(
      builder: (context, state) {
        final languageFilter = ReadDataCubit.get(context)
            .languageFilter; // Get language filter from the cubit
        return Text(
          _convertLanguageFilterEnumToString(languageFilter),
          style: TextStyle(
            color: ColorManger.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }

  String _convertLanguageFilterEnumToString(LanguageFilter languageFilter) {
    switch (languageFilter) {
      case LanguageFilter.allWords:
        return "All Words";
      case LanguageFilter.englishOnly:
        return "English Only";
      case LanguageFilter.arabicOnly:
        return "Arabic Only";
    }
  }
}
