import 'package:emergency_mode/cubits/siren_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SirenCubit extends Cubit<SirenState> {
  SirenCubit() : super(SirenCountdown());

  void startSiren() {
    emit(SirenPlaying());
  }

  void toggleSiren() {
    if (state is SirenCountdown) {
      emit(SirenCountdownStopped());
    } else if (state is SirenPlaying) {
      emit(SirenStopped());
    } else if (state is SirenCountdownStopped) {
      emit(SirenCountdown());
    } else if (state is SirenStopped) {
      emit(SirenPlaying());
    }
  }
}
