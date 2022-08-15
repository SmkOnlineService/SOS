import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sos/api/dio_instance.dart';
import 'package:sos/api/dio_service_exception.dart';
import 'package:sos/api/endpoints.dart';
import 'package:sos/main.dart';
import 'package:sos/module/auth/domain/models/default_response.dart';
import 'package:sos/module/auth/domain/repository/auth_repository_impl.dart';

class AuthRepository implements AuthRepositoryImpl {
  final _client = DioInstance().init();

  @override
  Future<DefaultResponse> logRegUser(queryParam) async {
    try {
      final response = await _client.post(
        Endpoints.logReg,
        data: queryParam,
        options: Options(
            contentType: "application/x-www-form-urlencoded")
      );
      
      return DefaultResponse.fromJson(response.data);
    } on DioError catch(err) {
      throw await handleDioError(err);
    }
  }

}