import 'package:flutter/material.dart';
import 'package:routing_and_notification/notification_with_firebase_postman/service/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexView extends StatelessWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SharedPreferences.getInstance().then((value) {
        final resultData = value.getString('notificationData');
        if (resultData != null && resultData.isNotEmpty) {
          MyRoute.route(resultData);
          value.setString('notificationData', '');
        }
      });
    });
    return Scaffold(
      //backgroundColor: Colors.amber,
      appBar: AppBar(
        title:const Text('Index Page'),
      ),
    );
  }
}
