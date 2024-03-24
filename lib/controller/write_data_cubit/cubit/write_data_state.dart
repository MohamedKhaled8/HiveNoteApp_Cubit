part of 'write_data_cubit.dart';

@immutable
sealed class WriteDataState {}

final class WriteDataCubitInitialState extends WriteDataState {}

final class WriteDataCubitLoadingState extends WriteDataState {}

final class WriteDataCubitSuccessState extends WriteDataState {}

final class WriteDataCubitFailedState extends WriteDataState {
  final String message;

  WriteDataCubitFailedState({required this.message});
}
