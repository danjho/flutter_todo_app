import 'package:dio/dio.dart';

extension DioExt on Dio {
  void updateInterceptors(String? token) {
    interceptors.clear();

    if (token!.isNotEmpty) {
      _setAuthInterceptor(token);
    }
  }

  void _setAuthInterceptor(String token) {
    interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Accept'] = 'application/json';
        options.headers['Authorization'] = 'Bearer $token';
        handler.next(options);
      },
    ));
  }
}
