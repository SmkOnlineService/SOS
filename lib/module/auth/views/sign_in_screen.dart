import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:sos/module/auth/controllers/sign_in_controllers.dart';
import 'package:sos/util/colours.dart';
import 'package:sos/widget/google_sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _controller = Get.put(SignInControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 500,
              ),
              Center(
                child: FutureBuilder(
                  future: _controller.initializeFirebase(),
                  builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return const GoogleSignInButton();
                  }

                  return const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colours.border),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
