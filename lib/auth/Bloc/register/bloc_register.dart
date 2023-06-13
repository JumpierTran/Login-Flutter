import 'package:camera_app/auth/Bloc/register/event_register.dart';
import 'package:camera_app/auth/Bloc/register/state_register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  Stream<RegisterEvent> mapEventToState(RegisterEvent event) async* {
  }
}
