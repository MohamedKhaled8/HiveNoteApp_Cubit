import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';
import 'package:dbhivelearn/controller/read_data_cubit/cubit/read_data_cubit.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/custom_filter_field.dart';

class CustomBodyDialogeFilter extends StatelessWidget {
  const CustomBodyDialogeFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit, ReadDataState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabelText("Language"),
            SizedBox(
              height: 10.h,
            ),
            CustomFilterField(
              conditionOfActivation: [
                ReadDataCubit.get(context).languageFilter ==
                    LanguageFilter.arabicOnly,
                ReadDataCubit.get(context).languageFilter ==
                    LanguageFilter.englishOnly,
                ReadDataCubit.get(context).languageFilter ==
                    LanguageFilter.allWords,
              ],
              labels: const ["Arabic", " English", "All"],
              onTap: [
                () => ReadDataCubit.get(context)
                    .updateLanguageFilter(LanguageFilter.arabicOnly),
                () => ReadDataCubit.get(context)
                    .updateLanguageFilter(LanguageFilter.englishOnly),
                () => ReadDataCubit.get(context)
                    .updateLanguageFilter(LanguageFilter.allWords),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            _buildLabelText("Sorted By"),
            SizedBox(
              height: 10.h,
            ),
            CustomFilterField(
              conditionOfActivation: [
                ReadDataCubit.get(context).sortedBy == SortedBy.time,
                ReadDataCubit.get(context).sortedBy == SortedBy.wordLength,
              ],
              labels: const [
                "Time",
                " Word Length ",
              ],
              onTap: [
                () => ReadDataCubit.get(context).updateSortedBy(SortedBy.time),
                () => ReadDataCubit.get(context)
                    .updateSortedBy(SortedBy.wordLength),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            // CustomSortedByFilter (),
            _buildLabelText("Sorting Type"),
            SizedBox(
              height: 10.h,
            ),
            // CustomSortingType(),
            CustomFilterField(
              conditionOfActivation: [
                ReadDataCubit.get(context).sortingType == SortingType.ascending,
                ReadDataCubit.get(context).sortingType ==
                    SortingType.descending,
              ],
              labels: const [
                "Asending",
                "Descending",
              ],
              onTap: [
                () => ReadDataCubit.get(context)
                    .updateSortingType(SortingType.ascending),
                () => ReadDataCubit.get(context)
                    .updateSortingType(SortingType.descending),
              ],
            ),
          ],
        );
      },
    );
  }
}

Widget _buildLabelText(String text) {
  return Text(
    text,
    style: TextStyle(
        color: ColorManger.white, fontWeight: FontWeight.bold, fontSize: 18.sp),
  );
}
