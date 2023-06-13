// Trạng thái liên quan đến danh sách thiết bị
abstract class DeviceState {}

class DeviceInitial extends DeviceState {}

class DeviceLoading extends DeviceState {}

class DeviceLoaded extends DeviceState {
  final List<dynamic> devices;

  DeviceLoaded({required this.devices});
}

class DeviceSuccess extends DeviceState {}

class DeviceError extends DeviceState {
  final String error;

  DeviceError({required this.error});
}