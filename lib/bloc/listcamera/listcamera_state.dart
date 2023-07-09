import 'package:camera_app/model/model_camera.dart';
import 'package:equatable/equatable.dart';

enum ListCameraStatus { init, success, fail }

class ListCameraState extends Equatable {
  final ListCameraStatus status;
  final List<CameraModel> data;

  ListCameraState({this.status = ListCameraStatus.init, this.data = const []});

  @override
  List<Object> get props => [status, data];

  ListCameraState copyWith({ListCameraStatus? status, List<CameraModel>? data}) {
    return ListCameraState(data: data ?? this.data,status: status ?? this.status);
  }
}

