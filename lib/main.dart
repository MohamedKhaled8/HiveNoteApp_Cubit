import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:dbhivelearn/constant/hive_constant.dart';
import 'package:dbhivelearn/model/word_type_adpter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordTypeAdapter());
  Hive.openBox(HiveConstance.wordsBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: TextScreen(),
    );
  }
}
