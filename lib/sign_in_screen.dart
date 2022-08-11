import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos/util/authentication.dart';
import 'package:sos/util/colours.dart';
import 'package:sos/widget/google_sign_in_button.dart';

class SignInScreen extends StatelessWidget {
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
                  future: Authentication.initializeFirebase(),
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
