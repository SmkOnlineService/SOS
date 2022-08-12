import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos/module/account/views/account_page.dart';
import 'package:sos/module/activity/views/activity_page.dart';
import 'package:sos/module/home/views/homepage.dart';
import 'package:sos/module/inbox/views/inbox_page.dart';
import 'package:sos/module/payment/views/payment_page.dart';
import 'package:sos/util/colours.dart';
import 'package:sos/module/dashboard/controllers/dashboard_controller.dart';

class Dashboard extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              Homepage(),
              ActivityPage(),
              PaymentPage(),
              InboxPage(),
              AccountPage()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colours.primaryColor,
                  unselectedItemColor: Colours.disabled,
                  onTap: controller.changeTabIndex,
                  currentIndex: controller.tabIndex.value,
                  items: const [
                    BottomNavigationBarItem(
                      label: "Home",
                      icon: Icon(Icons.home),
                    ),
                    BottomNavigationBarItem(
                        label: "Activity",
                        icon: Icon(Icons.receipt),),
                    BottomNavigationBarItem(
                      label: "Payment",
                      icon: Icon(Icons.account_balance_wallet)
                    ),
                    BottomNavigationBarItem(
                      label: "Inbox",
                      icon: Icon(Icons.inbox),
                    ),
                    BottomNavigationBarItem(
                        label: "Account",
                        icon: Icon(Icons.account_circle),),
                  ],
                ),
      ),
    );
  }
}
