import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sos/api/dio_instance.dart';
import 'package:sos/api/dio_service_exception.dart';
import 'package:sos/api/endpoints.dart';
import 'package:sos/main.dart';
import 'package:sos/module/auth/domain/models/sign_in_response.dart';
import 'package:sos/module/auth/domain/repository/auth_repository_impl.dart';
import 'package:sos/util/utility.dart';

class AuthRepository implements AuthRepositoryImpl {
  final _client = DioInstance().init();

  @override
  Future<SignInResponse> logRegUser(queryParam) async {
    try {
      final response = await _client.post(Endpoints.logReg,
          data: queryParam,
          options: Options(contentType: "application/x-www-form-urlencoded"));

      runHttpInspector(response.data);
      return SignInResponse.fromJson(json.decode(response.data));
    } on DioError catch (err) {
      throw await handleDioError(err);
    }
  }

  @override
  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Utility.showSnackbar(
              title: "Error",
              message:
                  'The account already exists with a different credential');
        } else if (e.code == 'invalid-credential') {
          Utility.showSnackbar(
              title: "Error",
              message:
                  'Error occurred while accessing credentials. Try again.');
        }
      } catch (e) {
        Utility.showSnackbar(
            title: "Error",
            message: "Error occurred using Google Sign in. Try again.");
      }
    }

    return user;
  }
}