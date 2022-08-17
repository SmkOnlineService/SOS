import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos/module/account/controllers/account_page_controller.dart';
import 'package:sos/util/utility.dart';
import 'package:sos/widget/border_button.dart';
import 'package:sos/widget/filled_button.dart';

class AccountPage extends StatelessWidget {
  final AccountPageController _controller = Get.put(AccountPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 48,
          ),
          Obx(
            () => CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(_controller.photoUrl.value),
            ),
          ),
          const SizedBox(height: 56),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Informasi Akun"),
                Text(
                  "Edit",
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Nama"),
                Text(_controller.name.value),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("No Telp."),
                Text(_controller.phoneNumber.value),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Email"),
                Text(_controller.email.value),
              ],
            ),
          ),
          const SizedBox(height: 128),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BorderButton(
                "Sign Out",
                () => Utility.showDialog(
                    "Logout",
                    const Text("Apakah Anda yakin ingin keluar?",
                        textAlign: TextAlign.center),
                    "Ya", () {
                  _controller.signOut();
                }, const TextStyle(color: Colors.red)),
                colour: Colors.red,
                size: 100,
              ),
              FilledButton(
                "Hapus Akun",
                () => Utility.showDialog(
                    "Hapus Akun",
                    const Text(
                      "Apakah Anda yakin ingin menghapus akun ini ? \n akun anda tidak akan bisa kembali",
                      textAlign: TextAlign.center,
                    ),
                    "Hapus Akun",
                    () {},
                    const TextStyle(color: Colors.red)),
                colour: Colors.red,
                size: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
