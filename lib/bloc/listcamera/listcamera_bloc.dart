import 'package:camera_app/bloc/listcamera/listcamera_event.dart';
import 'package:camera_app/bloc/listcamera/listcamera_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListcameraBloc extends Bloc<ListcameraEvent, ListcameraState> {
  ListcameraBloc() : super(ListcameraInitial()) {
    on<ListcameraEvent>((event, emit) {
    });
  }
}
