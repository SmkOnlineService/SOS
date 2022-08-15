import 'dart:io';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sos/util/app_config.dart';
import 'package:sos/util/route_name.dart';
import 'package:sos/util/route_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  String initialRoute = RouteName.signInPage;

  EncryptedSharedPreferences prefs = EncryptedSharedPreferences();

  await prefs.getString('accessToken').then((value) {
    if (value != '') {
      initialRoute = RouteName.dashboard;
    } else {
      initialRoute = RouteName.signInPage;
    }
  });

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (Platform.isAndroid) {
      await const MethodChannel('com.example.sos/general')
          .invokeMethod<String>('getFlavor')
          .then((String? flavor) async {
        if (flavor == 'production') {
          AppConfig.load(
              version: packageInfo.version, build: packageInfo.buildNumber);
        } else {
          AppConfig.load(
              flavor: Flavor.staging,
              version: packageInfo.version,
              build: packageInfo.buildNumber);
        }
      });
    } else {
      AppConfig.load(
          version: packageInfo.version, build: packageInfo.buildNumber);
    }
    runApp(SosApp(initialRoute: initialRoute));
  });
}

class SosApp extends StatelessWidget {
  final String initialRoute;

  const SosApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SMK Online Service',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: initialRoute,
      locale: const Locale('en', 'US'),
      getPages: RoutePage.routes,
    );
  }
}
