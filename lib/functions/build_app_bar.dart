import 'package:flutter/material.dart';
import 'package:dbhivelearn/model/word_wodel.dart';
import 'package:dbhivelearn/controller/write_data_cubit/cubit/write_data_cubit.dart';

AppBar buildAppBarWordDetailes(BuildContext context,
    {required WordModel wordModel}) {
  return AppBar(
    actions: [
      IconButton(
          onPressed: () => _deleteWord(wordModel: wordModel, context: context),
          icon: const Icon(Icons.delete))
    ],
    foregroundColor: Color(wordModel.colorCode),
    centerTitle: true,
    title: Text(
      "Word Detailes",
      style: TextStyle(color: Color(wordModel.colorCode)),
    ),
  );
}

void _deleteWord(
    {required BuildContext context, required WordModel wordModel}) {
  WriteDataCubit.get(context).deleteWord(wordModel.indexAtDatabase);

  Navigator.pop(context);
}
