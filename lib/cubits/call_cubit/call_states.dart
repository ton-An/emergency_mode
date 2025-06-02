import 'package:equatable/equatable.dart';

abstract class CallState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CallInitialState extends CallState {}

class CallAudioOnlyState extends CallState {}

class CallFrontVideoState extends CallState {}

class CallBackVideoState extends CallState {}
