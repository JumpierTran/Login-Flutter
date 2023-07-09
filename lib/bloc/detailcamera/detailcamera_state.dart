import 'package:equatable/equatable.dart';

enum DetailCameraStatus { init, success, fail }

class DetailCameraState extends Equatable {
  final DetailCameraStatus status;
  final List<DetailCameraState> data;
  const DetailCameraState(
      {this.status = DetailCameraStatus.init, this.data = const []});

  @override
  List<Object> get props => [status,data];

  DetailCameraState copyWith(
      {DetailCameraStatus? status, List<DetailCameraState>? data}) {
    return DetailCameraState(
        data: data ?? this.data, status: status ?? this.status);
  }
}
