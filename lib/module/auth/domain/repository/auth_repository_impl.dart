import 'package:firebase_auth/firebase_auth.dart';
import 'package:sos/module/auth/domain/models/sign_in_response.dart';

abstract class AuthRepositoryImpl {
  Future<SignInResponse> logRegUser(dynamic queryParam);
  Future<User?> signInWithGoogle();
}