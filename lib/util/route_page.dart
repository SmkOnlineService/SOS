import 'package:get/get.dart';
import 'package:sos/module/account/controllers/account_page_controller.dart';
import 'package:sos/module/account/controllers/edit_account_controller.dart';
import 'package:sos/module/account/views/account_page.dart';
import 'package:sos/module/account/views/edit_account_page.dart';
import 'package:sos/module/activity/views/activity_page.dart';
import 'package:sos/module/dashboard/views/dashboard.dart';
import 'package:sos/module/auth/views/sign_in_screen.dart';
import 'package:sos/module/home/controllers/homepage_controller.dart';
import 'package:sos/module/home/views/homepage.dart';
import 'package:sos/module/inbox/views/inbox_page.dart';
import 'package:sos/module/payment/views/payment_page.dart';
import 'package:sos/module/search_jasa/controller/search_service_controller.dart';
import 'package:sos/module/search_jasa/views/search_service_page.dart';
import 'package:sos/util/route_name.dart';
import 'package:sos/module/dashboard/controllers/dashboard_controller.dart';

class RoutePage {
  static final routes = [
    GetPage(
      name: RouteName.dashboard, 
      page: () => Dashboard(),
      binding: BindingsBuilder(() => Get.lazyPut(() => DashboardController()))),
    GetPage(
      name: RouteName.homepage, 
      page: () => Homepage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => HomepageController()))),
    GetPage(
      name: RouteName.activityPage, 
      page: () => ActivityPage(),),
    GetPage(
      name: RouteName.accountPage, 
      page: () => AccountPage(),
      binding: BindingsBuilder(() => Get.put<AccountPageController>(AccountPageController()))),
    GetPage(
      name: RouteName.inboxPage, 
      page: () => InboxPage(),),
    GetPage(
      name: RouteName.paymentPage, 
      page: () => PaymentPage(),),

    GetPage(
      name: RouteName.editAccountPage, 
      page: () => EditAccountPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => EditAccountController()))),
    GetPage(
      name: RouteName.searchJasaPage,
      page: () => SearchServicePage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => SearchServiceController()))),
    
    GetPage(
      name: RouteName.signInPage, 
      page: () => SignInScreen()),
  ];
}
