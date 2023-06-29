// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:camera_app/model/model_camera.dart';
import 'package:equatable/equatable.dart';

abstract class ListCameraState extends Equatable {
  const ListCameraState();

  @override
  List<Object> get props => [];
}

class ListCameraInitial extends ListCameraState {}

class ListCameraLoading extends ListCameraState {}

class ListCameraLoaded extends ListCameraState {
  final List<Attributes> cameraList;
  ListCameraLoaded(this.cameraList);
}

class ListCameraFailure extends ListCameraState {
  final String errorMessage;
  ListCameraFailure({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
