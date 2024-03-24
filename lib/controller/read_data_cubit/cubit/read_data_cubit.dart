import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dbhivelearn/model/word_wodel.dart';
import 'package:dbhivelearn/constant/hive_constant.dart';

part 'read_data_state.dart';

enum LanguageFilter {
  arabicOnly,
  englishOnly,
  allWords,
}

enum SortedBy { time, wordLength }

enum SortingType { ascending, descending }

class ReadDataCubit extends Cubit<ReadDataState> {
  static get(context) => BlocProvider.of(context);

  ReadDataCubit() : super(ReadDataCubitInitial());

  final Box _box = Hive.box(HiveConstance.wordsBox);

  LanguageFilter languageFilter = LanguageFilter.allWords;

  SortedBy sortedBy = SortedBy.time;
  SortingType sortingType = SortingType.descending;

  void updateLanguageFilter(LanguageFilter languageFilter) {
    this.languageFilter = languageFilter;
  }

  void updateSortingType(SortingType sortingType) {
    this.sortingType = sortingType;
  }

  void updateSortedBy(SortedBy sortedBy) {
    this.sortedBy = sortedBy;
  }

//1- لو اليوزر عايز كل الكلمات
//2-لو عايز من الليست الكلمات العربي بتروح هي تيشل الانجليزي والعكس
//3- هترتب الكلمات
//4- هتعمل فلتر

  void getWords() {
    emit(ReadDataCubitLoadingState());
    try {
      List<WordModel> wordsToReturn =
          List.from(_box.get(HiveConstance.wordsList, defaultValue: []))
              .cast<WordModel>();
      _removeUnwantedWords(wordsToReturn);
      _applySorting(wordsToReturn);
      emit(ReadDataCubitSuccessState(words: wordsToReturn));
    } catch (error) {
      emit(ReadDataCubitFailedState(
          message: "we have problems at get , please try again"));
    }
  }

  void _removeUnwantedWords(List<WordModel> wordsToReturn) {
    if (languageFilter == LanguageFilter.allWords) {
      return;
    }
    for (var i = 0; i < wordsToReturn.length; i++) {
      if ((languageFilter == LanguageFilter.arabicOnly &&
              wordsToReturn[i].isArabic == false) ||
          (languageFilter == LanguageFilter.englishOnly &&
              wordsToReturn[i].isArabic == true)) {
        wordsToReturn.removeAt(i);
        i--;
      }
    }
  }

  void _applySorting(List<WordModel> wordsToReturn) {
    if (sortedBy == SortedBy.time) {
      return;
    } else {
      wordsToReturn.sort(
          (WordModel a, WordModel b) => a.text.length.compareTo(b.text.length));
      if (sortingType == SortingType.ascending) {
        return;
      } else {
        _reverse(wordsToReturn);
      }
    }
  }

  void _reverse(List<WordModel> wordsToReturn) {
    for (var i = 0; i < wordsToReturn.length; i++) {
      WordModel temp = wordsToReturn[i];
      wordsToReturn[i] = wordsToReturn[wordsToReturn.length - 1 - i];
      wordsToReturn[wordsToReturn.length - 1 - i] = temp;
    }
  }
}
