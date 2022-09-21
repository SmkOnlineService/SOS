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
    // _dio.interceptors.add(alice.getDioInterceptor());

    return _dio;
  }
}

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    String token = "";

    if (options.headers.containsKey("requiresToken")) {
      options.headers.remove("requiresToken");

      EncryptedSharedPreferences prefs = EncryptedSharedPreferences();

      await prefs.getString("accessToken").then((data) {
        token = data;
      });

      options.headers.addAll({
          "access_token": token
        });
    }

    super.onRequest(options, handler);
  }
}