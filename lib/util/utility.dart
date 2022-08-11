import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:sos/util/colours.dart';

class Utility {
  static showSnackbar({required String title, required String message}) {
    return Get.snackbar(title, message,
        margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
        colorText: Colours.primaryColor,
        borderColor: Colours.primaryColor,
        borderWidth: 1.0,
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }
}