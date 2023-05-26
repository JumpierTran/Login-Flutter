import 'package:dio/dio.dart';
import 'package:camera_app/service/Store.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await Store.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers['Content-type'] = 'application/json';
    super.onRequest(options, handler);
  }
}
