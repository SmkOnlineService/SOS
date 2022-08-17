import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sos/api/dio_service_exception.dart';
import 'package:sos/module/account/domain/models/user_response.dart';
import 'package:sos/module/account/domain/services/user_repository.dart';
import 'package:sos/util/route_name.dart';
import 'package:sos/util/utility.dart';

class AccountPageController extends GetxController {
  final UserRepository _repository = UserRepository();

  RxString photoUrl = "".obs;
  RxString name = "".obs;
  RxString phoneNumber = "".obs;
  RxString email = "".obs;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  getUserData() {
    _repository.getUserData().then((data) {
      UserData user = data.result![0];

      photoUrl.value = user.photo;
      name.value = user.name;
      phoneNumber.value = user.phone ?? "-";
      email.value = user.email;
    }, onError: (err) {
      if (err is DioServiceException) {
        Utility.showSnackbar(title: "Error", message: err.message);
      }
    });
  }

  Future<void> signOut() async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();

    final GoogleSignIn googleSignIn = GoogleSignIn();

    prefs.clear().then((success) async {
      if (success) {
        try {
          await googleSignIn.signOut();
          await FirebaseAuth.instance.signOut();
          Get.offAllNamed(RouteName.signInPage);
        } catch (err) {
          Utility.showSnackbar(
              title: "Error", message: "Error signing out. Try again.");
        }
      } else {
        Utility.showSnackbar(
              title: "Error", message: "Error signing out. Try again.");
      }
    });
  }
}
