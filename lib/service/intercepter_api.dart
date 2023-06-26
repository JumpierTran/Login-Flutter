import 'dart:developer';

import 'package:camera_app/core/global.dart';
import 'package:dio/dio.dart';

class InterceptorApi extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    if (Global.session != '') {
      options.headers['session'] = Global.session;
    }

    log("URL: ${options.baseUrl}${options.path}");
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    log('************ Api Error - Start ************:',);
    log(err.message.toString());
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    log('************** Api Response - Start ************');
    log(response.data.toString());
  }
}
