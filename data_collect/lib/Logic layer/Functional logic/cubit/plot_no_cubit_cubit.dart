import 'package:bloc/bloc.dart';


// import 'package:meta/meta.dart';


part 'plot_no_cubit_state.dart';


class PlotNoCubitCubit extends Cubit<PlotNoCubitState> {

  PlotNoCubitCubit() : super(PlotNoCubitState(plotNo: 1));


  void increment() => emit(PlotNoCubitState(plotNo: state.plotNo + 1));

  void reset() => emit(PlotNoCubitState(plotNo: 1));

  void decrement() {

    final newPlotNo = state.plotNo - 1;

    if (newPlotNo >= 0) {

      emit(PlotNoCubitState(plotNo: newPlotNo));

    }

  }

}

