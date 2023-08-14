import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:routing_and_notification/notification_with_firebase_postman/service/notification_schedular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FcmService {
  static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  void init() async {
    firebaseMessaging.requestPermission(alert: true, badge: true, sound: true);
    firebaseMessaging.getToken().then((value) => debugPrint('>>>>>>>>>>>$value'));

    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) async{
      await showNotification(remoteMessage.data);
    });
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  }

  static Future backgroundHandler(RemoteMessage remoteMessage)async{
    await showNotification(remoteMessage.data);
    final prefs=await SharedPreferences.getInstance();
    prefs.setString('notificationData', remoteMessage.data['noti_type']);
  }
  static Future showNotification(Map<String, dynamic>data) async {
    await NotificationScheduler().displayNotification(
        data['title'], data['body'], data['noti_type'], data['image']);
  }
}