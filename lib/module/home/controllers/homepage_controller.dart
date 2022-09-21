import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' as material;
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sos/module/home/domain/models/banner_response.dart';
import 'package:sos/module/home/domain/services/home_repository.dart';
import 'package:sos/util/utility.dart';

class HomepageController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  final HomeRepository _repository = HomeRepository();

  RxList<Banner> listBanner = <Banner>[].obs;
  RxString userAddress = "".obs;

  @override
  void onInit() {
    super.onInit();

    checkGpsPermission();
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

  checkGpsPermission() async {
    LocationPermission permission;
    var serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Get.snackbar("Error", "gps belum diaktifkan");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Utility.showDialog(
          "Izin Ditolak", 
          const material.Text("izin lokasi dibutuhkan untuk menggunakan fitur aplikasi ini", textAlign: material.TextAlign.center), 
          "Minta izin gps", () async {
            Get.back();
            await Geolocator.requestPermission();
          }, const material.TextStyle(color: material.Colors.black),);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Error", "ijin akses gps dibatasi permanen, silahkan aktifkan ijin gps di setting aplikasi");
    }

    await getLocation();
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    Address address = await GeoCode().reverseGeocoding(latitude: position.latitude, longitude: position.longitude);

    userAddress.value = "${address.streetAddress}, ${address.city}";
  }
}