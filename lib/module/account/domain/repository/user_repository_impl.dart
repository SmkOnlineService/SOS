import 'package:sos/module/account/domain/models/user_response.dart';
import 'package:sos/module/auth/domain/models/default_response.dart';

abstract class UserRepositoryImpl {
  Future<UserResponse> getUserData();
  Future<DefaultResponse> updateUserData(data);
  Future<DefaultResponse> deleteAccount();
}