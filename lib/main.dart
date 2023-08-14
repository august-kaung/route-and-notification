import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:routing_and_notification/go_router_testing/route_helper.dart';
import 'package:routing_and_notification/local_notification_testing/pages/home_page.dart';
import 'package:routing_and_notification/notification_with_firebase_postman/service/fcm_service.dart';
import 'package:routing_and_notification/notification_with_firebase_postman/views/index_view.dart';
import 'notification_with_firebase_postman/views/home_view.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FcmService().init();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static final naviGatorKey=GlobalKey<NavigatorState>();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: MyApp.naviGatorKey,
      home: const HomePage()
    );
      // MaterialApp.router(
      // routerConfig: RouteHelper.returnRouter(true),
      // debugShowCheckedModeBanner: false,
      //routeInformationParser: RouteHelper.returnRouter(true).routeInformationParser,
      //routerDelegate: RouteHelper.returnRouter(true).routerDelegate,
      //routeInformationProvider: RouteHelper.returnRouter(true).routeInformationProvider,
    //);
  }
}
