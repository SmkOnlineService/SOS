import 'package:get/get.dart';
import 'package:sos/api/dio_service_exception.dart';
import 'package:sos/module/auth/domain/services/auth_repository.dart';
import 'package:sos/util/route_name.dart';
import 'package:sos/util/utility.dart';

class SignInControllers extends GetxController {
  
  final AuthRepository _repository = AuthRepository();

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

    _repository.logRegUser(params).then((result) {
      Get.offNamed(RouteName.dashboard);
    }, onError: (err) {
      if (err is DioServiceException) {
        Utility.showSnackbar(title: "Error", message: err.message);
      }
    });
  }
}