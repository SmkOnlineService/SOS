import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:sos/api/dio_service_exception.dart';
import 'package:sos/module/auth/domain/services/auth_repository.dart';
import 'package:sos/util/route_name.dart';
import 'package:sos/util/utility.dart';

class SignInControllers extends GetxController {
  
  final AuthRepository _repository = AuthRepository();

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    
    return firebaseApp;
  }

  Future<User?> googleSignIn() async => await _repository.signInWithGoogle();

  logRegUser(
    String name,
    String email,
    String photoUrl,
    String accessToken
  ) {

    final params = {
      'name': name,
      'email': email,
      'photo': photoUrl,
      'token': accessToken,
    };

    _repository.logRegUser(params).then((value) async {
      EncryptedSharedPreferences prefs = EncryptedSharedPreferences();

      if (value.status) {
        await prefs.setString("idUser", value.result?.idUser ?? "-");
        Get.offNamed(RouteName.dashboard);
      }
    }, onError: (err) {
      if (err is DioServiceException) {
        Utility.showSnackbar(title: "Error", message: err.message);
      }
    });
  }
}