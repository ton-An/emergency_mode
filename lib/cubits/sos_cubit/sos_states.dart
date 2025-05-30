import 'package:equatable/equatable.dart';

abstract class SOSState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SOSInitial extends SOSState {}

class SOSContactModeSelection extends SOSState {}
