import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/color_manger.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/done_button.dart';
import 'package:dbhivelearn/controller/read_data_cubit/cubit/read_data_cubit.dart';
import 'package:dbhivelearn/controller/write_data_cubit/cubit/write_data_cubit.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/custom_form_widgets.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/arabic_or_english_widgets.dart';

class AddWordDialogeDetailesScreenWidget extends StatefulWidget {
  final bool isExample;
  final int colorCode;
  final int indexAtDatabase;
  const AddWordDialogeDetailesScreenWidget({
    Key? key,
    required this.isExample,
    required this.colorCode,
    required this.indexAtDatabase,
  }) : super(key: key);

  @override
  State<AddWordDialogeDetailesScreenWidget> createState() =>
      _AddWordDialogeDetailesScreenWidgetState();
}

class _AddWordDialogeDetailesScreenWidgetState
    extends State<AddWordDialogeDetailesScreenWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.all(30).r,
        backgroundColor: Color(widget.colorCode),
        child: BlocConsumer<WriteDataCubit, WriteDataState>(
            builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10).r,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ArabicOrEnglishWidget(
                    colorCode: widget.colorCode,
                    arabicIsSelected: WriteDataCubit.get(context).isArabic),
                SizedBox(
                  height: 20.h,
                ),
                CustomForm(
                    lable:
                        widget.isExample ? "New Example" : "New Similar Word",
                    formKey: _formKey),
                SizedBox(
                  height: 20.h,
                ),
                DoneButton(
                    colorCode: widget.colorCode,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (widget.isExample) {
                          WriteDataCubit.get(context)
                              .addExample(widget.indexAtDatabase);
                        } else {
                          WriteDataCubit.get(context)
                              .addSimilarword(widget.indexAtDatabase);
                        }
                        ReadDataCubit.get(context).getWords();
                      }
                    })
              ],
            ),
          );
        }, listener: (context, state) {
          if (state is WriteDataCubitSuccessState) {
            Navigator.pop(context);
          }
          if (state is WriteDataCubitFailedState) {
            ScaffoldMessenger.of(context).showSnackBar(_buildSnakBar(state));
          }
        }));
  }

  SnackBar _buildSnakBar(WriteDataCubitFailedState state) =>
      SnackBar(backgroundColor: ColorManger.red, content: Text(state.message));
}
