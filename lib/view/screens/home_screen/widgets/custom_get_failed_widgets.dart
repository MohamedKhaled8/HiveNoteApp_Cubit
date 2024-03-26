import 'package:flutter/material.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/exption_widget.dart';

class CustomGeFailedWidgets extends StatelessWidget {
  final String message;
  const CustomGeFailedWidgets({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExceptionWidget(iconData: Icons.error, message: message);
  }
}