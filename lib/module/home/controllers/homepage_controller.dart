import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sos/module/home/domain/models/banner_response.dart';
import 'package:sos/module/home/domain/services/home_repository.dart';
import 'package:sos/util/utility.dart';

class HomepageController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  final HomeRepository _repository = HomeRepository();

  RxList<Banner> listBanner = <Banner>[].obs;

  @override
  void onInit() {
    super.onInit();

    getBannerPromo();
  }

  getBannerPromo() {
    _repository.getBanner().then((data) {
      if (data.result != null) {
        listBanner.addAll(data.result ?? List.empty());
      }
    }, onError: (err) {
      Utility.showSnackbar(title: "Error", message: "Kesalahan saat mengambil data");
    });
  }
}