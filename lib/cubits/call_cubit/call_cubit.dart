import 'package:emergency_mode/cubits/call_cubit/call_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallCubit extends Cubit<CallState> {
  CallCubit() : super(CallInitialState());

  void acceptCall() {
    emit(CallAudioOnlyState());
  }

  void toggleCallMethod() {
    if (state is CallAudioOnlyState) {
      emit(CallFrontVideoState());
    } else {
      emit(CallAudioOnlyState());
    }
  }

  void toggleCameraDirection() {
    if (state is CallFrontVideoState) {
      emit(CallBackVideoState());
    } else {
      emit(CallFrontVideoState());
    }
  }
}
