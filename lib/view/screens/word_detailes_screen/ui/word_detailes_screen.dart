import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dbhivelearn/model/word_wodel.dart';
import 'package:dbhivelearn/functions/build_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/exption_widget.dart';
import 'package:dbhivelearn/controller/read_data_cubit/cubit/read_data_cubit.dart';
import 'package:dbhivelearn/controller/write_data_cubit/cubit/write_data_cubit.dart';
import 'package:dbhivelearn/view/screens/home_screen/widgets/custom_oading_widget.dart';
import 'package:dbhivelearn/view/screens/word_detailes_screen/widgets/add_word_dialoge.dart';
import 'package:dbhivelearn/view/screens/word_detailes_screen/widgets/word_info_detailes_screen_widget.dart';
import 'package:dbhivelearn/view/screens/word_detailes_screen/widgets/add_similar_word_button_detailes_screen.dart';

class WordDetailesScreen extends StatefulWidget {
  final WordModel wordModel;
  const WordDetailesScreen({
    Key? key,
    required this.wordModel,
  }) : super(key: key);

  @override
  State<WordDetailesScreen> createState() => _WordDetailesScreenState();
}

class _WordDetailesScreenState extends State<WordDetailesScreen> {
  late WordModel _wordModel;

  @override
  void initState() {
    _wordModel = widget.wordModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWordDetailes(context, wordModel: widget.wordModel),
      body: BlocBuilder<ReadDataCubit, ReadDataState>(
        builder: (context, state) {
          if (state is ReadDataCubitSuccessState) {
            int index = state.words.indexWhere((element) =>
                element.indexAtDatabase == _wordModel.indexAtDatabase);
            _wordModel = state.words[index];
            return _buildSuccessBodyDetailesScreen(context);
          }
          if (state is ReadDataCubitFailedState) {
            return ExceptionWidget(
                iconData: Icons.error, message: state.message);
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }

  ListView _buildSuccessBodyDetailesScreen(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      children: [
        _buildLabelText(text: 'Word'),
        SizedBox(height: 10.h),
        WordInfoDetailesWidget(
          color: Color(_wordModel.colorCode),
          text: _wordModel.text,
          isArabic: _wordModel.isArabic,
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            _buildLabelText(text: 'Similar Word'),
            const Spacer(),
            AddWordSimilarButtonDetailesScreen(
              color: Color(_wordModel.colorCode),
              onTap: () => showDialog(
                context: context,
                builder: (context) => AddWordDialogeDetailesScreenWidget(
                  colorCode: _wordModel.colorCode,
                  isExample: false,
                  indexAtDatabase: _wordModel.indexAtDatabase,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        for (int i = 0; i < _wordModel.arabicSimilatWords.length; i++)
          WordInfoDetailesWidget(
            color: Color(_wordModel.colorCode),
            text: _wordModel.arabicSimilatWords[i],
            onPressed: () => _deleteArabicSimilarWord(i, isSimilarWord: true),
            isArabic: true,
          ),
        for (int i = 0; i < _wordModel.englishSimilatWords.length; i++)
          WordInfoDetailesWidget(
            color: Color(_wordModel.colorCode),
            text: _wordModel.englishSimilatWords[i],
            isArabic: false,
            onPressed: () => _deleteEnglishSimilarWord(i),
          ),
        SizedBox(height: 20.h),
        Row(
          children: [
            _buildLabelText(text: 'Example'),
            const Spacer(),
            AddWordSimilarButtonDetailesScreen(
              color: Color(_wordModel.colorCode),
              onTap: () => showDialog(
                context: context,
                builder: (context) => AddWordDialogeDetailesScreenWidget(
                  colorCode: _wordModel.colorCode,
                  isExample: true,
                  indexAtDatabase: _wordModel.indexAtDatabase,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        for (int i = 0; i < _wordModel.arabicExample.length; i++)
          WordInfoDetailesWidget(
            color: Color(_wordModel.colorCode),
            text: _wordModel.arabicExample[i],
            isArabic: true,
            onPressed: () => _deleteArabicExapmle(i),
          ),
        for (int i = 0; i < _wordModel.englishExapmle.length; i++)
          WordInfoDetailesWidget(
            color: Color(_wordModel.colorCode),
            text: _wordModel.englishExapmle[i],
            isArabic: false,
            onPressed: () => _deleteEnglishExapmle(i),
          ),
      ],
    );
  }

  void _deleteArabicSimilarWord(int index, {bool isSimilarWord = true}) {
    WriteDataCubit.get(context)
        .deleteSimilarWord(_wordModel.indexAtDatabase, index, isSimilarWord);
    if (isSimilarWord) {
      ReadDataCubit.get(context).getWords();
    }
  }

  void _deleteEnglishSimilarWord(int index, {bool isSimilarWord = true}) {
    WriteDataCubit.get(context)
        .deleteSimilarWord(_wordModel.indexAtDatabase, index, isSimilarWord);
    if (isSimilarWord) {
      ReadDataCubit.get(context).getWords();
    }
  }

  void _deleteArabicExapmle(int index, {bool isExample = true}) {
    WriteDataCubit.get(context)
        .deleteExample(_wordModel.indexAtDatabase, index, isExample);
    if (isExample) {
      ReadDataCubit.get(context).getWords();
    }
  }

  void _deleteEnglishExapmle(int index, {bool isExample = true}) {
    WriteDataCubit.get(context)
        .deleteExample(_wordModel.indexAtDatabase, index, isExample);
    if (isExample) {
      ReadDataCubit.get(context).getWords();
    }
  }

  Text _buildLabelText({required String text}) {
    return Text(
      text,
      style: TextStyle(
        color: Color(_wordModel.colorCode),
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
