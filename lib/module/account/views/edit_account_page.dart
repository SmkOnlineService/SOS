import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sos/module/account/controllers/edit_account_controller.dart';
import 'package:sos/widget/filled_button.dart';

class EditAccountPage extends GetView<EditAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _content(),
    );
  }

  Widget _content() {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 32),
              Form(
                  key: controller.editAccountKey,
                  child: Column(
                    children: [
                      _fullname(),
                      const SizedBox(height: 24),
                      _phoneNumber()
                    ],
                  )),
              const SizedBox(height: 16),
            ],
          ),
        )),
        Obx(
          () => controller.isLoading.value
          ? const CircularProgressIndicator()
          : FilledButton(
            "Simpan",
            () {
              if (controller.editAccountKey.currentState!.validate()) {
                controller.upsertAccountData();
              }
            },
            size: 350,
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _fullname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Nama Lengkap"),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller.fullnameController,
          decoration: const InputDecoration(hintText: "Isi nama lengkap anda"),
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z ]*$'))],
          validator: (text) {
            if (text == null || text.isEmpty) {
              return "Nama lengkap tidak boleh kosong";
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        )
      ],
    );
  }

  Widget _phoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("No. Telp"),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text("+62"),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 100,
              child: TextFormField(
                controller: controller.phoneNumberController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: "Isi no telpon anda"),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  //To remove first '0'
                  FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                  //To remove first '94' or your country code
                  FilteringTextInputFormatter.deny(RegExp(r'^62+')),
                ],
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "No telpon tidak boleh kosong";
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
          ],
        )
      ],
    );
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
