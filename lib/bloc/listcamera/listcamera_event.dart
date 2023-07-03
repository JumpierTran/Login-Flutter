import 'package:equatable/equatable.dart';

abstract class ListCameraEvent extends Equatable {
  const ListCameraEvent();

  @override
  List<Object> get props => [];
}

class GetListCamera extends ListCameraEvent {}  
