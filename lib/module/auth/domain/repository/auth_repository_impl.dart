import 'package:sos/module/auth/domain/models/default_response.dart';

abstract class AuthRepositoryImpl {
  Future<DefaultResponse> logRegUser(dynamic queryParam);
}