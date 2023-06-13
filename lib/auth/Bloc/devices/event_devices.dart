abstract class DeviceEvent{}

// Sự kiện liên quan đến danh sách thiết bị

class GetDevices extends DeviceEvent {}

class PostDeviceInfo extends DeviceEvent {
  final Map<String, dynamic> deviceInfo;

  PostDeviceInfo({required this.deviceInfo});
}