import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'read_data_state.dart';

class ReadDataCubit extends Cubit<ReadDataState> {
  ReadDataCubit() : super(ReadDataInitial());
}
