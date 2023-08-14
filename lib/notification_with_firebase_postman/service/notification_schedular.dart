import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:routing_and_notification/notification_with_firebase_postman/service/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationScheduler {
  NotificationScheduler.internal() {
    init();
  }

  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static final NotificationScheduler _singleton =
      NotificationScheduler.internal();

  factory NotificationScheduler() => _singleton;

  void init() {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_stat_adb');
    const DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: darwinInitializationSettings);
    _plugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
      SharedPreferences.getInstance().then((value) {
        value.setString('notificationData', '');
      });
      MyRoute.route(response.payload ?? '');
    });
  }

  Future displayNotification(
      String title, String body, String payload, String? img) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            channelDescription: 'description',
            importance: Importance.max,
            priority: Priority.max,
            styleInformation: (img != null && img.isNotEmpty)
                ? null
                : const BigTextStyleInformation(''));
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
    await _plugin.show(0, title, body, notificationDetails, payload: payload);
  }
}
