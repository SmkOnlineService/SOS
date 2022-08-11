import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sos/util/authentication.dart';
import 'package:sos/util/route_name.dart';

class DashboardController extends GetxController {

  RxBool isSigningOut = false.obs;

  User? user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    isSigningOut.value = true;
    await Authentication.signOut();
    Get.toNamed(RouteName.signInPage);
  }
}