import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/done_button.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/colors_widgets.dart';
import 'package:dbhivelearn/controller/read_data_cubit/cubit/read_data_cubit.dart';
import 'package:dbhivelearn/controller/write_data_cubit/cubit/write_data_cubit.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/custom_form_widgets.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/arabic_or_english_widgets.dart';

class AddWordDialoge extends StatefulWidget {
  const AddWordDialoge({super.key});

  @override
  State<AddWordDialoge> createState() => _AddWordDialogeState();
}

class _AddWordDialogeState extends State<AddWordDialoge> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: BlocConsumer<WriteDataCubit, WriteDataState>(
      listener: (context, state) {
        if (state is WriteDataCubitSuccessState) {
          Navigator.pop(context);
        }
        if (state is WriteDataCubitFailedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(_buildSnakBar(state.message));
        }
      },
      builder: (context, state) {
        return AnimatedContainer(
          padding: const EdgeInsets.all(10).r,
          color: Color(WriteDataCubit.get(context).colorCode),
          duration: const Duration(milliseconds: 750),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ArabicOrEnglishWidget(
                  arabicIsSelected: WriteDataCubit.get(context).isArabic,
                  colorCode: WriteDataCubit.get(context).colorCode,
                ),
                SizedBox(
                  width: 10.w,
                ),
                ColorsWidgets(
                    activeColorCode: WriteDataCubit.get(context).colorCode),
                SizedBox(
                  width: 10.w,
                ),
                CustomForm(lable: "New Word", formKey: formKey),
                SizedBox(
                  height: 10.h,
                ),
                DoneButton(
                  colorCode: WriteDataCubit.get(context).colorCode,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      WriteDataCubit.get(context).addWord();
                      ReadDataCubit.get(context).getWords();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    ));
  }

  SnackBar _buildSnakBar(
    String message,
  ) =>
      SnackBar(
        content: Text(message),
        backgroundColor: ColorManger.red,
      );
}
