import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detailcamera_event.dart';
part 'detailcamera_state.dart';

class DetailcameraBloc extends Bloc<DetailcameraEvent, DetailcameraState> {
  DetailcameraBloc() : super(DetailcameraInitial()) {
    on<DetailcameraEvent>((event, emit) {
    });
  }
}
