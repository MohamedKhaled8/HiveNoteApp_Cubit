import 'package:hive/hive.dart';
import 'package:dbhivelearn/model/word_wodel.dart';

class WordTypeAdapter extends TypeAdapter<WordModel> {
  @override
  WordModel read(BinaryReader reader) {
    return WordModel(
      indexAtDatabase: reader.readInt(),
      text: reader.readString(),
      isArabic: reader.readBool(),
      colorCode: reader.readInt(),
      arabicSimilatWords: reader.readStringList(),
      englishSimilatWords: reader.readStringList(),
      arabicExample: reader.readStringList(),
      englishExapmle: reader.readStringList(),
    );
  }

  @override
  int get typeId => 0; 

  @override
  void write(BinaryWriter writer, WordModel obj) {
    writer.writeInt(obj.indexAtDatabase);
    writer.writeString(obj.text);
    writer.writeBool(obj.isArabic);
    writer.writeInt(obj.colorCode);
    writer.writeStringList(obj.arabicSimilatWords);
    writer.writeStringList(obj.englishSimilatWords);
    writer.writeStringList(obj.arabicExample);
    writer.writeStringList(obj.englishExapmle);
  }
}
