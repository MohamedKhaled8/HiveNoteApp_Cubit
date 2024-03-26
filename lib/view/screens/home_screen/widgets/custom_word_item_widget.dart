import 'package:flutter/material.dart';
import 'package:dbhivelearn/model/word_wodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';
import 'package:dbhivelearn/controller/read_data_cubit/cubit/read_data_cubit.dart';
import 'package:dbhivelearn/view/screens/word_detailes_screen/ui/word_detailes_screen.dart';

class CustomWordItemWidget extends StatelessWidget {
  final WordModel wordModel;

  const CustomWordItemWidget({
    Key? key,
    required this.wordModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WordDetailesScreen(
                    wordModel: wordModel,
                  ))).then((value) async {
        Future.delayed(const Duration(seconds: 1)).then((value) {
          ReadDataCubit.get(context).getWords();
        });
      }),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(wordModel.colorCode),
        ),
        child: Center(
          child: Text(
            wordModel.text,
            style: TextStyle(
                color: ColorManger.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
