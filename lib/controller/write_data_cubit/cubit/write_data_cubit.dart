import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dbhivelearn/model/word_wodel.dart';
import 'package:dbhivelearn/constant/hive_constant.dart';

part 'write_data_state.dart';

class WriteDataCubit extends Cubit<WriteDataState> {
  static WriteDataCubit get(context) => BlocProvider.of(context);

  WriteDataCubit() : super(WriteDataCubitInitialState());

//attributes
//1- box
//2- text
//3- isArabic
//4- color

  final box = Hive.box(HiveConstance.wordsBox);
  String text = '';
  bool isArabic = true;
  int colorCode = 0xFF4A47A3;

//methods

// initalize
  WordModel _initalModel(List<WordModel> words) {
    return WordModel(
        indexAtDatabase: words.length,
        text: text,
        isArabic: isArabic,
        colorCode: colorCode);
  }

  // return lineBoc

  List<WordModel> _getWordsFromDataBase() =>
      List.from(box.get(HiveConstance.wordsList, defaultValue: []));

  // _tryAndCatchBloc
  void _tryAndCatchBloc(VoidCallback methodToEcvute, String message) {
    emit(WriteDataCubitLoadingState());
    try {
      methodToEcvute.call();
      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailedState(message: message));
    }
  }


// saveDatabaseInput 
  Future<void> _saveDatabaseInput(List<WordModel> words) async {
    box.put(HiveConstance.wordsList, words);
  }

//1- add allWord

  void addWord() {
    _tryAndCatchBloc(() {
      List<WordModel> words = _getWordsFromDataBase().cast<WordModel>();
      words.add(_initalModel(words));
      _saveDatabaseInput(words);
    }, "we have problems when we add word , please try again");
  }


//2- delete allWord
  void deleteWord(int indexAtDatabase) {
    _tryAndCatchBloc(() {
      List<WordModel> words = _getWordsFromDataBase().cast<WordModel>();

      words.removeAt(indexAtDatabase);
      for (var i = indexAtDatabase; i < words.length; i++) {
        words[i] = words[i].decementIndexAtBatabase();
      }
            _saveDatabaseInput(words);

      // box.put(HiveConstance.wordsList, words);
    }, "we have problems when we Delete word , please try again");
  }

//3-add similarWord

  void addSimilarword(int indexAtDataBase) {
    _tryAndCatchBloc(() {
      List<WordModel> words = _getWordsFromDataBase();
      words[indexAtDataBase] =
          words[indexAtDataBase].addSimilarWord(text, isArabic);
      _saveDatabaseInput(words);
    }, "we have problems when we addSimilarWord , please try again");
  }

//4-delete similarWord
  void deleteSimilarWord(
    int indexAtDataBase,
    int indexAtSimilarWords,
    bool isArabicSimilarWord,
  ) {
    _tryAndCatchBloc(() {
      List<WordModel> words = _getWordsFromDataBase();
      words[indexAtDataBase] = words[indexAtDataBase]
          .deleateSimilar(indexAtSimilarWords, isArabicSimilarWord);
      _saveDatabaseInput(words);
    }, "we have problems when we deleateSimilarWord , please try again");
  }

//5-add Example

  void addExample(int indexAtDataBase) {
    _tryAndCatchBloc(() {
      List<WordModel> words = _getWordsFromDataBase();
      words[indexAtDataBase] =
          words[indexAtDataBase].addExapmle(text, isArabic);
      _saveDatabaseInput(words);
    }, "we have problems when we addExample , please try again");
  }
//6-remove similarWord

  void deleteExample(
    int indexAtDataBase,
    int indexAtExapmles,
    bool isArabicExample,
  ) {
    _tryAndCatchBloc(() {
      List<WordModel> words = _getWordsFromDataBase();
      words[indexAtDataBase] = words[indexAtDataBase]
          .deleteExample(indexAtExapmles, isArabicExample);
      _saveDatabaseInput(words);
    }, "we have problems when we deleteExamples , please try again");
  }

//7-update text
  void updateText(String text) {
    this.text = text;
  }

//8-update isArabic
  void updateIsAraic(bool isArabic) {
    this.isArabic = isArabic;
  }

//9-update color
  void updateColorCode(int colorCode) {
    this.colorCode = colorCode;
  }
}
