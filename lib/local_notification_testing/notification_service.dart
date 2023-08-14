import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../utils.dart';

class NotificationService {
  NotificationService();

  final notificationPlugin = FlutterLocalNotificationsPlugin();
  final BehaviorSubject<String?> subject=BehaviorSubject();
  Future initialize() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_stat_adb');

    DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    InitializationSettings initializationSettings = InitializationSettings(
        iOS: darwinInitializationSettings,
        android: androidInitializationSettings);

    await notificationPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  Future<NotificationDetails> notificationDetails() async {

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            channelDescription: 'description',
            importance: Importance.max,
            priority: Priority.max,
            //icon: 'flutter_logo',
            playSound: true,
            channelShowBadge: true,

        );
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();

    return const NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
  }

  //Big Picture
  Future<NotificationDetails> bigPictureNotificationDetails() async {
    final largeIconPath= await Utils.downloadFile('https://www.cleverfiles.com/howto/wp-content/uploads/2018/03/minion.jpg', 'largeIcon');
    final bigPicturePath=await Utils.downloadFile('https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8anBnfGVufDB8fDB8fHww&w=1000&q=80', 'bigPicture');
    BigPictureStyleInformation bigPictureStyleInformation=
     BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      //hideExpandedLargeIcon: false,
      //DrawableResourceAndroidBitmap('assets/download.jpg'),
      //contentTitle: 'Panda Chilling',
      largeIcon: FilePathAndroidBitmap(largeIconPath)
    );
     AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('channelIdBig', 'channelNameBig',
      channelDescription: 'descriptionBig',
      importance: Importance.max,
      priority: Priority.max,
      //icon: largeIconPath,
      playSound: true,
      channelShowBadge: true,
      styleInformation: bigPictureStyleInformation
    );
    const DarwinNotificationDetails darwinNotificationDetails =
    DarwinNotificationDetails();

    return  NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
  }
  Future showBigPicNotification(
      {required int id,
        required String title,
        required String body
      }) async {
    final bigDetails = await bigPictureNotificationDetails();
    await notificationPlugin.show(
        id,
        title,
        body,
        bigDetails
    );
  }


  Future showNotification(
      {required int id,
      required String title,
      required String body
      }) async {
    final details = await notificationDetails();
    await notificationPlugin.show(
        id,
        title,
        body,
        details
        );
  }
  Future showScheduledNotification(
      {required int id,
        required String title,
        required String body,
        required int second}) async {
    final details = await notificationDetails();
    await notificationPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
            DateTime.now().add(Duration(seconds: second)), tz.local),
        details,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }
  Future showNotificationWithPayload(
      {required int id,
        required String title,
        required String body,
        required String payload
      }) async {
    final details = await notificationDetails();
    await notificationPlugin.show(
        id,
        title,
        body,
        details,
        payload: payload
    );
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse? notificationResponse) {
    print(notificationResponse);
    if(notificationResponse?.payload!=null){
    subject.add(notificationResponse?.payload);
    }
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print(id);
  }
}
