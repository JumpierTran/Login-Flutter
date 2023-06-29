import 'dart:math';

import 'package:camera_app/bloc/listcamera/listcamera_event.dart';
import 'package:camera_app/bloc/listcamera/listcamera_state.dart';
import 'package:camera_app/model/model_camera.dart';
import 'package:camera_app/service/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCameraBloc extends Bloc<ListCameraEvent, ListCameraState> {
  final AuthService _authService = AuthService();
  ListCameraBloc() : super(ListCameraInitial()) {
    on<GetListCamera>(_fetchListCamera);
  }

  void _fetchListCamera(
      GetListCamera event, Emitter<ListCameraState> emit) async {
    emit(ListCameraLoading());

    try {
      final cameraData = await _authService.getcamera(event);
      emit(ListCameraLoaded(cameraData as List<Attributes>));
    } catch (e) {
      emit(ListCameraFailure(errorMessage: 'Lỗi không lấy được API $e'));
    }
  }
}
