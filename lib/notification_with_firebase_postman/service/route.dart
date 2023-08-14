import 'package:flutter/material.dart';
import 'package:routing_and_notification/main.dart';
import 'package:routing_and_notification/notification_with_firebase_postman/views/details_view.dart';
import 'package:routing_and_notification/notification_with_firebase_postman/views/home_view.dart';
import 'package:routing_and_notification/notification_with_firebase_postman/views/setting_view.dart';

class MyRoute {
  static void route(String name) {
    if (name == PageName.homeView.name) {
      MyApp.naviGatorKey.currentState
          ?.push(MaterialPageRoute(builder: (_) => const HomeView()));
    } else if (name == PageName.detailsView.name) {
      MyApp.naviGatorKey.currentState
          ?.push(MaterialPageRoute(builder: (_) => const DetailsView()));
    } else if (name == PageName.settingView.name) {
      MyApp.naviGatorKey.currentState
          ?.push(MaterialPageRoute(builder: (_) => const SettingView()));
    }
  }
}

enum PageName { homeView, detailsView, settingView, indexView }
