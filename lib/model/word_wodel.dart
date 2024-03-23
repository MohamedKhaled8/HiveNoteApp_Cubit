class WordModel {
  final int indexAtDatabase;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilatWords;
  final List<String> englishSimilatWords;
  final List<String> arabicExample;
  final List<String> englishExapmle;

  const WordModel({
    required this.indexAtDatabase,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilatWords = const [],
    this.englishSimilatWords = const [],
    this.arabicExample = const [],
    this.englishExapmle = const [],
  });

  WordModel devrementIndexAtBatabase() {
    return WordModel(
        indexAtDatabase: indexAtDatabase - 1,
        text: text,
        isArabic: isArabic,
        colorCode: colorCode,
        arabicSimilatWords: arabicSimilatWords,
        arabicExample: arabicExample,
        englishSimilatWords: englishSimilatWords,
        englishExapmle: englishExapmle);
  }

  WordModel deleteExample(int indexAtExample, bool isArabicExapmle) {
    List<String> newExapmle = _intoalizeNewExapmle(isArabicExapmle);
    newExapmle.removeAt(indexAtExample);
    return _getWordAfterCheckExample(newExapmle, isArabicExapmle);
  }

  WordModel addExapmle(String example, bool isArabicExapmle) {
    List<String> newExapmle = _intoalizeNewExapmle(isArabicExapmle);
    newExapmle.add(example);
    return _getWordAfterCheckExample(newExapmle, isArabicExapmle);
  }

  WordModel addSimilarWord(String similarWord, bool isArabicSimilarWord) {
    List<String> newSimilarWords =
        _inttializeNewSimilarWords(isArabicSimilarWord);

    newSimilarWords.add(similarWord);
    return _getWordAfterCheckSimilarWords(newSimilarWords, isArabicSimilarWord);
  }

  WordModel deleateSimilar(int indexAtSimilarWord, bool isArabicSimilarWord) {
    List<String> newSimilarWords =
        _inttializeNewSimilarWords(isArabicSimilarWord);

    newSimilarWords.removeAt(indexAtSimilarWord);
    return _getWordAfterCheckSimilarWords(newSimilarWords, isArabicSimilarWord);
  }

  List<String> _inttializeNewSimilarWords(bool isArabicSimilarWord) {
    if (isArabicSimilarWord) {
      return List.from(arabicSimilatWords);
    } else {
      return List.from(englishSimilatWords);
    }
  }

  WordModel _getWordAfterCheckSimilarWords(
      List<String> newSimilarWords, bool isArabicSimilarWord) {
    return WordModel(
        indexAtDatabase: indexAtDatabase,
        text: text,
        isArabic: isArabic,
        colorCode: colorCode,
        arabicSimilatWords:
            isArabicSimilarWord ? newSimilarWords : arabicSimilatWords,
        englishSimilatWords:
            !isArabicSimilarWord ? newSimilarWords : englishSimilatWords);
  }

  List<String> _intoalizeNewExapmle(bool isArabicExapmle) {
    if (isArabicExapmle) {
      return List.from(arabicExample);
    } else {
      return List.from(englishExapmle);
    }
  }

  WordModel _getWordAfterCheckExample(
      List<String> newExapmle, bool isArabicExapmle) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicExample: arabicSimilatWords,
      englishSimilatWords: englishSimilatWords,
      arabicSimilatWords: isArabicExapmle ? newExapmle : arabicExample,
      englishExapmle: !isArabicExapmle ? newExapmle : englishExapmle,
    );
  }
}
