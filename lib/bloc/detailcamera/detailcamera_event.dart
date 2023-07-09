import 'package:equatable/equatable.dart';

abstract class DetailCameraEvent extends Equatable {
  const DetailCameraEvent();

  @override
  List<Object> get props => [];
}

class SeeDetailCameraEvent extends DetailCameraEvent {}


