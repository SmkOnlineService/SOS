import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  FlutterLocalNotificationsPlugin localNotifications = FlutterLocalNotificationsPlugin();

  init() {
    var initSettingAndroid = const AndroidInitializationSettings('@drawable/team');
    var initSettingIos = const IOSInitializationSettings();
    var initSettings = InitializationSettings(android: initSettingAndroid, iOS: initSettingIos);
    localNotifications.initialize(initSettings);
  }

  void showNotification(String title, String body) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'importance_notification', 'Sos notification',
        importance: Importance.max, playSound: true, showProgress: true, priority: Priority.high);

    var iOSChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSChannelSpecifics);

    await localNotifications.show(0, title, body, platformChannelSpecifics,);
  }
}