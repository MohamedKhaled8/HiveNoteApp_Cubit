import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dbhivelearn/controller/read_data_cubit/cubit/read_data_cubit.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/custom_get_word_widget.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/custom_get_loading_widget.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/custom_get_failed_widgets.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/custom_get_empty_word_widgets.dart';

class CustomWordWidgets extends StatelessWidget {
  const CustomWordWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit, ReadDataState>(builder: (context, state) {
      if (state is ReadDataCubitSuccessState) {
        if (state.words.isEmpty) {
          return const CustomGetEmptyWordWidgets();
        }
        return CustomGetWordWidgets(
          wordModel: state.words,
        );
      } else if (state is ReadDataCubitFailedState) {
        return CustomGeFailedWidgets(
          message: state.message,
        );
      } else {
        return const CustomGetLoadingWidgets();
      }
    });
  }
}









