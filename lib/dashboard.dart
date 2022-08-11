import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos/util/colours.dart';
import 'package:sos/widget/dashboard_controller.dart';
import 'package:sos/widget/filled_button.dart';

class Dashboard extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 80),
            child: TextFormField(
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintStyle: TextStyle(
                      color: Colours.border,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                  hintText: "Cari disini"),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Text("${controller.user?.displayName} \n ${controller.user?.email}"),
          const SizedBox(
            height: 200,
          ),
          Obx(() => controller.isSigningOut.value
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : SizedBox(width: 150, child: FilledButton("Sign out", () => controller.signOut())))
        ],
      ),
    );
  }
}
