import 'package:flutter/material.dart';
import 'package:dbhivelearn/model/word_wodel.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/custom_word_item_widget.dart';

class CustomGetWordWidgets extends StatelessWidget {
  final List<WordModel> wordModel;
  const CustomGetWordWidgets({
    Key? key,
    required this.wordModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: wordModel.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 2 / 1.5),
        itemBuilder: (context, index) {
          return CustomWordItemWidget(
            wordModel: wordModel[index],
          );
        });
  }
}
