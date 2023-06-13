import 'package:camera_app/auth/Bloc/devices/event_devices.dart';
import 'package:camera_app/auth/Bloc/devices/state_devices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceBLoc extends Bloc<DeviceEvent, DeviceState>{
  DeviceBLoc() : super(DeviceInitial());

}