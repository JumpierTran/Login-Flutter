import 'package:camera_app/bloc/listcamera/listcamera_event.dart';
import 'package:camera_app/bloc/listcamera/listcamera_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListcameraBloc extends Bloc<CameraEvent, CameraState> {
  ListcameraBloc() : super(CameraInitial()) {
  }

  void _fetchCameraEvent(CameraEvent event, Emitter<CameraEvent> emit) {
  }
}
