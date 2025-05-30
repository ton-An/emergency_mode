import 'package:emergency_mode/cubits/sos_cubit/sos_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SOSCubit extends Cubit<SOSState> {
  SOSCubit() : super(SOSInitial());

  void toContactModeSelection() {
    emit(SOSContactModeSelection());
  }

  void toInitial() {
    emit(SOSInitial());
  }
}
