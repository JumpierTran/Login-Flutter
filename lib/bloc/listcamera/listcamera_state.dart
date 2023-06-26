// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class CameraState extends Equatable {
  const CameraState();

  @override
  List<Object> get props => [];
}

class CameraInitial extends CameraState {}

class CameraLoading extends CameraState {}

class CameraSuccess extends CameraState {
  
}

class CameraFailure extends CameraState {
  final String errorMessage;

  CameraFailure({
    required this.errorMessage,
  });
  
  @override
  List<Object> get props => [];
}
