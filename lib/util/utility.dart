import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:sos/util/colours.dart';
import 'package:intl/intl.dart';

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

  static showDialog(
      String title, Widget middleText, String onConfirmText, VoidCallback onConfirm, TextStyle onConfirmStyle,
      {String onCancelText = "Batal"}) {
    return Get.dialog(AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      insetPadding: const EdgeInsets.symmetric(vertical: 150.0, horizontal: 40.0),
      buttonPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      title: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colours.primaryColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
            child: middleText,
          ),
          const SizedBox(height: 20),
          const Divider(color: Colours.disabled, thickness: 1, height: 1),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      onCancelText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Colours.disabled,
                  thickness: 1,
                  width: 1,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: onConfirm,
                    child: Text(
                      onConfirmText,
                      textAlign: TextAlign.center,
                      style: onConfirmStyle,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  static showServiceDialog(String textInfo) {
    return Get.dialog(AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
      buttonPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(textInfo),
          ),
          const SizedBox(height: 20),
          const Divider(color: Colours.disabled, thickness: 1, height: 1),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      "Tutup",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  static showTimeDialog(TextEditingController timeTextController) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: SizedBox(
        height: 280,
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colours.primaryColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Pilih waktu layanan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24,),
                SizedBox(
                    height: 100,
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0),
                      use24hFormat: true,
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: (time) {
                        timeTextController.text = DateFormat('kk:mm').format(time);
                      },
                    )),
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Get.back(),
                        child: const Text(
                          "Cancel",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.blueGrey,
                      thickness: 1,
                      width: 1,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'OK',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colours.primaryColor, fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}