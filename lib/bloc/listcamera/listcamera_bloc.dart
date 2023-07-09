import 'package:camera_app/bloc/listcamera/listcamera_event.dart';
import 'package:camera_app/bloc/listcamera/listcamera_state.dart';
import 'package:camera_app/service/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCameraBloc extends Bloc<ListCameraEvent, ListCameraState> {
  final AuthService _authService = AuthService();
  ListCameraBloc() : super(ListCameraState()) {
    on<GetListCamera>(_fetchListCamera);
  }

  void _fetchListCamera(
      GetListCamera event, Emitter<ListCameraState> emit) async {
    emit(state.copyWith(status: ListCameraStatus.init));
    await _authService.getcamera().then((value) {
      emit(state.copyWith(status: ListCameraStatus.success, data: value));
    }).onError((error, stackTrace) {
      emit(state.copyWith(status: ListCameraStatus.fail));
    });
    
    // try {
    //   final cameraData = await _authService.getcamera();
    //   emit(ListCameraLoaded(cameraData as List<CameraModel>));
    // } catch (e) {
    //   emit(ListCameraFailure(
    //       errorMessage: "Lỗi không lấy được danh sách camera:$e"));
    //   print(e);
    // }
  }
}
