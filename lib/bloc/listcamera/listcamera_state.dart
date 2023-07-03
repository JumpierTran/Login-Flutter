import 'package:camera_app/model/model_camera.dart';
import 'package:equatable/equatable.dart';

abstract class ListCameraState extends Equatable {}

// class ListCameraInitial extends ListCameraState {
//   @override
//   List<Object> get props => [];
// }

class ListCameraLoading extends ListCameraState {
  @override
  List<Object?> get props => [];
}

class ListCameraLoaded extends ListCameraState {
  final List<CameraModel> cameraList;
  ListCameraLoaded(this.cameraList);

  @override
  List<Object?> get props => [cameraList];
}

class ListCameraFailure extends ListCameraState {
  final String errorMessage;
  ListCameraFailure({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}
