import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dbhivelearn/model/word_type_adpter.dart';
import 'package:dbhivelearn/constant/db/hive_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/constant/style/theme_manger.dart';
import 'package:dbhivelearn/view/screens/home_screen/ui/home_screen.dart';
import 'package:dbhivelearn/controller/read_data_cubit/cubit/read_data_cubit.dart';
import 'package:dbhivelearn/controller/write_data_cubit/cubit/write_data_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordTypeAdapter());
  await Hive.openBox(HiveConstance.wordsBox);

  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ReadDataCubit()..getWords()),
          BlocProvider(create: (context) => WriteDataCubit()),
        ],
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeManger.getTheme(),
                title: 'Flutter Demo',
                home: const HomeScreen(),
              );
            }));
  }
}
