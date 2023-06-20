import 'package:camera_app/page/CameraPage.dart';
import 'package:camera_app/page/detailcamera.dart';
import 'package:camera_app/page/register.dart';
import 'package:camera_app/page/login.dart';
import 'package:camera_app/page/splash_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class RouterFluro {
  static FluroRouter fluroRouter = FluroRouter();

  static var screenSplashHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return SplashSreen();
  });
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
    fluroRouter.define("/",
        handler: screenSplashHandler,
        transitionType: TransitionType.fadeIn);
    fluroRouter.define("/login",
        handler: screenLoginHandler,
        transitionType: TransitionType.inFromLeft);
    fluroRouter.define("/register",
        handler: screenRegisterHandler,
        transitionType: TransitionType.inFromRight);
    fluroRouter.define("/images",
        handler: screenCameraPageHandler,
        transitionType: TransitionType.fadeIn);
    fluroRouter.define('/devices',
        handler: screenDetailCameraHandler,
        transitionType: TransitionType.nativeModal);
  }
}
