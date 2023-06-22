import 'package:equatable/equatable.dart';

abstract class DetailCameraState extends Equatable {
  const DetailCameraState();

  @override
  List<Object> get props => [];
}

class DetailCameraInitial extends DetailCameraState {}

class DetailCameraLoading extends DetailCameraState {}

class DetailCameraSuccess extends DetailCameraState {}

class DetailCameraFailure extends DetailCameraState {
  final String? errorMessage;

  DetailCameraFailure(this.errorMessage);

}
