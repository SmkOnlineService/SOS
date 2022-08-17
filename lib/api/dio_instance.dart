import 'package:dio/dio.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
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

    if (options.headers.containsKey("requiresToken")) {
      options.headers.remove("requiresToken");

      EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
      prefs.getString("accessToken").then((data) {
        options.headers.addAll({
          "access_token": data
        });
      });
    }

    super.onRequest(options, handler);
  }
}