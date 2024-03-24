part of 'read_data_cubit.dart';

@immutable
sealed class ReadDataState {}

final class ReadDataCubitInitial extends ReadDataState {}

final class ReadDataCubitLoadingState extends ReadDataState {}

final class ReadDataCubitSuccessState extends ReadDataState {
  final List<WordModel> words;

  ReadDataCubitSuccessState({required this.words});
}

final class ReadDataCubitFailedState extends ReadDataState {
  final String message;

  ReadDataCubitFailedState({required this.message});
}
