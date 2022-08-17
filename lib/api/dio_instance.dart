import 'package:dio/dio.dart';
import 'package:sos/main.dart';

class DioInstance {
  Dio init() {
    Dio _dio = Dio(
      BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 5000
      )
    );
    _dio.interceptors.add(DioInterceptors());
    _dio.interceptors.add(alice.getDioInterceptor());

    return _dio;
  }
}

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }
}