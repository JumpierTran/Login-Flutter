import 'package:camera_app/bloc/listcamera/listcamera_event.dart';
import 'package:camera_app/bloc/listcamera/listcamera_state.dart';
import 'package:camera_app/model/model_camera.dart';
import 'package:camera_app/model/model_camera.dart';
import 'package:camera_app/service/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCameraBloc extends Bloc<ListCameraEvent, ListCameraState> {
  final AuthService _authService = AuthService();
  ListCameraBloc() : super(ListCameraLoading()) {
    on<GetListCamera>(_fetchListCamera);
  }

  void _fetchListCamera(
      GetListCamera event, Emitter<ListCameraState> emit) async {
    emit(ListCameraLoading());
    print(event.props);
    try {
      final cameraData = await _authService.getcamera(event);
      emit(ListCameraLoaded(cameraData as List<CameraModel>));
    } catch (e) {
      emit(ListCameraFailure(
          errorMessage: "Lỗi không lấy được danh sách camera:$e"));
      print(e);
    }
  }
}
