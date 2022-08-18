import 'package:dio/dio.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:sos/api/dio_instance.dart';
import 'package:sos/api/dio_service_exception.dart';
import 'package:sos/api/endpoints.dart';
import 'package:sos/main.dart';
import 'package:sos/module/account/domain/models/user_response.dart';
import 'package:sos/module/account/domain/repository/user_repository_impl.dart';
import 'package:sos/module/auth/domain/models/default_response.dart';

class UserRepository implements UserRepositoryImpl {
  final _client = DioInstance().init();
  EncryptedSharedPreferences prefs = EncryptedSharedPreferences();

  @override
  Future<UserResponse> getUserData() async {
    String idUser = "";

    await prefs.getString('idUser').then((value) {
      idUser = value;
    });

    try {
      final response = await _client.get(Endpoints.user,
          queryParameters: {'id_user': idUser},
          options: Options(
              headers: {"requiresToken": true},
              contentType: "application/x-www-form-urlencoded"));

      runHttpInspector(response.data);
      return UserResponse.fromJson(response.data);
    } on DioError catch (err) {
      throw await handleDioError(err);
    }
  }

  @override
  Future<DefaultResponse> updateUserData(data) async {
    try {
      final response = await _client.put(Endpoints.user,
          data: data,
          options: Options(
              headers: {"requiresToken": true},
              contentType: "application/x-www-form-urlencoded"));

      runHttpInspector(response.data);
      return DefaultResponse.fromJson(response.data);
    } on DioError catch (err) {
      throw await handleDioError(err);
    }
  }

  @override
  Future<DefaultResponse> deleteAccount() async {
    try {
      final response = await _client.delete(Endpoints.user,
          data: {'id_user': await prefs.getString('idUser')},
          options: Options(
              headers: {"requiresToken": true},
              contentType: "application/x-www-form-urlencoded"));

      runHttpInspector(response.data);
      return DefaultResponse.fromJson(response.data);
    } on DioError catch (err) {
      throw await handleDioError(err);
    }
  }
}
