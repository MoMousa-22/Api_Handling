import 'package:dio/dio.dart';

// this interceptor is a Request Man :) to show options in dioConsumer
class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['token'] = 'THE TOKEN HERE'; // if i want to send token
    options.headers['lang'] = 'en'; // if i want to send lang
    super.onRequest(options, handler);
  }
}
