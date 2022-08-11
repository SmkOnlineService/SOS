import 'package:get/get.dart';
import 'package:sos/dashboard.dart';
import 'package:sos/sign_in_screen.dart';
import 'package:sos/util/route_name.dart';
import 'package:sos/widget/dashboard_controller.dart';

class RoutePage {
  static final routes = [
    GetPage(
      name: RouteName.dashboard, 
      page: () => Dashboard(),
      binding: BindingsBuilder(() => Get.lazyPut(() => DashboardController()))),
    GetPage(
      name: RouteName.signInPage, 
      page: () => SignInScreen()),
  ];
}
