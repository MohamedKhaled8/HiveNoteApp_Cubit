import 'package:flutter/material.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/exption_widget.dart';

class CustomGetEmptyWordWidgets extends StatelessWidget {
  const CustomGetEmptyWordWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ExceptionWidget(
        iconData: Icons.list_rounded, message: "Empty Words List");
  }
}