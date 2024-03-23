import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'write_data_state.dart';

class WriteDataCubit extends Cubit<WriteDataState> {
  WriteDataCubit() : super(WriteDataInitial());
}
