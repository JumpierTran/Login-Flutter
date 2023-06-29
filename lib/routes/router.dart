import 'package:camera_app/page/listcamera.dart';
import 'package:camera_app/page/detailcamera.dart';
import 'package:camera_app/page/register.dart';
import 'package:camera_app/page/login.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class RouterFluro {
  static FluroRouter fluroRouter = FluroRouter();

  static var screenLoginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HomeLoginPage();
  });
  static var screenRegisterHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HomeRegisterPage();
  });
  static var screenCameraPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return CameraPage();
  });
  static var screenDetailCameraHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return DetailMyCamera();
  });

  static initRoutes() {
    fluroRouter.define("/login",
        handler: screenLoginHandler,
        transitionType: TransitionType.inFromLeft);
    fluroRouter.define("/register",
        handler: screenRegisterHandler,
        transitionType: TransitionType.inFromRight);
    fluroRouter.define("/dashboard",
        handler: screenCameraPageHandler,
        transitionType: TransitionType.fadeIn);
    fluroRouter.define('/images',
        handler: screenDetailCameraHandler,
        transitionType: TransitionType.fadeIn);
  }
}
