import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos/api/dio_service_exception.dart';
import 'package:sos/module/account/domain/services/user_repository.dart';
import 'package:sos/util/utility.dart';

class EditAccountController extends GetxController {
  GlobalKey<FormState> editAccountKey = GlobalKey<FormState>();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final EncryptedSharedPreferences prefs = EncryptedSharedPreferences();

  final UserRepository _repository = UserRepository();

  var args = Get.arguments;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    if (args != null) {
      fullnameController.text = args['fullname'];
      phoneNumberController.text = args['phoneNumber'].toString().replaceRange(0, 2, "");
    }
  }

  upsertAccountData() async {
    isLoading.value = true;
    String idUser = await prefs.getString("idUser");

    final params = {
      'id_user': idUser,
      'fullname': fullnameController.text,
      'phone': "62${phoneNumberController.text}",
    };

    _repository.updateUserData(params).then((value) {
      isLoading.value = false;
      Utility.showSnackbar(title: "Berhasil", message: "Berhasil memperbarui data");
    }, onError: (err) {
      isLoading.value = false;
      if (err is DioServiceException) {
        Utility.showSnackbar(title: "Error", message: err.message);
      }
    });
  }
}