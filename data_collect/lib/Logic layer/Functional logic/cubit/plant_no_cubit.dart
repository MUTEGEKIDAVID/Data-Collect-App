import 'package:bloc/bloc.dart';


part 'plant_no_state.dart';


class PlantNoCubit extends Cubit<PlantNoState> {

  PlantNoCubit() : super(PlantNoState(plantNo: 0));


  void increment() => emit(PlantNoState(plantNo: state.plantNo + 1));


  void reset() => emit(PlantNoState(plantNo: 0));


  void decrement() {

    final newplantNo = state.plantNo - 1;


    if (newplantNo >= 0) {

      emit(PlantNoState(plantNo: newplantNo));

    }

  }

}

