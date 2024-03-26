import 'package:flutter/material.dart';
import 'package:dbhivelearn/functions/build_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/custom_word_widgets.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/filter_dialoge_button.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/language_filter_widgets.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/build_floating_action_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: getFloatingActionButton(context),
      appBar: AppBar(
        centerTitle: true,
        title: const Text ( "Home"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: const Column(
          children: [
            Row(
              children: [
                CustomLanguageFilterWidget(),
                Spacer(),
                CustomFilterDialogeButton(),
              ],
            ),
            Expanded(child: CustomWordWidgets()),
          ],
        ),
      ),
    );
  }
}
