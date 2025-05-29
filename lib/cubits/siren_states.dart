import 'package:equatable/equatable.dart';

abstract class SirenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SirenCountdown extends SirenState {}

class SirenCountdownStopped extends SirenState {}

class SirenPlaying extends SirenState {}

class SirenStopped extends SirenState {}
