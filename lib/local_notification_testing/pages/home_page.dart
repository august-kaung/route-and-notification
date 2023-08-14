import 'package:flutter/material.dart';
import 'package:routing_and_notification/local_notification_testing/pages/second_page.dart';

import '../notification_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NotificationService service;

  @override
  void initState() {
    service = NotificationService();
    service.initialize();
    listenToNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ///Simple Notification
            ElevatedButton(
                onPressed: () async {
                  await service.showNotification(
                      id: 0, title: 'Title', body: 'Body');
                },
                child: const Text('Simple Notification')),
            ElevatedButton(
                onPressed: () async {
                  await service.showBigPicNotification(
                      id: 0, title: 'Title', body: 'hahaBody');
                },
                child: const Text('Simple Notification With Big Picture')),
            ///Scheduled Notification
            ElevatedButton(
                onPressed: () async {
                  await service.showScheduledNotification(
                      id: 0,
                      title: 'ScheduledTitle',
                      body: 'ScheduledBody',
                      second: 4);
                },
                child: const Text('Schedule Simple Notification')),
            ///Notification with payload
            ElevatedButton(
                onPressed: () async {
                  await service.showNotificationWithPayload(
                      id: 0,
                      title: 'Hello World',
                      body: 'Biology is the study of living thing.',
                      payload: 'Hello World This is notification with payload');
                },
                child: const Text('Route Simple Notification')),
          ],
        ),
      ),
    );
  }

  void listenToNotification() =>
      service.subject.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => SecondPage(payload: payload)));
    }
  }
}
