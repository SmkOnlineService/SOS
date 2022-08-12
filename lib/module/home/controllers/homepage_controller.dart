import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sos/util/authentication.dart';
import 'package:sos/util/route_name.dart';

class HomepageController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;

  RxBool isSigningOut = false.obs;

  Future<void> signOut() async {
    isSigningOut.value = true;
    await Authentication.signOut();
    Get.toNamed(RouteName.signInPage);
  }
}