import 'package:camera_app/page/CameraPage.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:camera_app/page/signin.dart';
import 'package:camera_app/page/signup.dart';

class RouterFluro {
  static FluroRouter fluroRouter = FluroRouter();

  static var screenSignInHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return homeLoginPage();
  });
  static var screenSignUpHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return homeSignUp();
  });
  static var screenCameraPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return CameraPage();
  });

  static initRoutes() {
    fluroRouter.define("/", handler: screenSignInHandler, transitionType: TransitionType.inFromLeft);
    fluroRouter.define("/signup", handler: screenSignUpHandler, transitionType: TransitionType.inFromLeft);
    fluroRouter.define("/devices", handler: screenCameraPageHandler, transitionType: TransitionType.fadeIn);


  }
}
