import 'package:flutter/material.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/add_word_dialoge.dart';
  import 'package:dbhivelearn/constant/style/color_manger.dart';


  FloatingActionButton getFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorManger.white,
      child: const Icon(
        Icons.add,
        color: ColorManger.black,
      ),
      onPressed: () => showDialog(
          context: context, builder: (context) => const AddWordDialoge()),
    );
  }
