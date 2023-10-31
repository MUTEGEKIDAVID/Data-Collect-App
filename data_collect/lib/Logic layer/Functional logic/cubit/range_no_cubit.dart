import 'package:bloc/bloc.dart';




part 'range_no_state.dart';


class RangeNoCubit extends Cubit<RangeNoState> {

  RangeNoCubit() : super(RangeNoState(rangeNo: 1));


  void increment() => emit(RangeNoState(rangeNo: state.rangeNo + 1));
   void reset() => emit(RangeNoState(rangeNo: 1));

  void decrement() {
    final new_range_No = state.rangeNo - 1;
    if (new_range_No >= 0) {
      emit(RangeNoState(rangeNo: new_range_No));
    }
  }

}

