import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../route_constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key,required this.password,required this.userName});
  final String userName;
  final String password;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('LOGIN SCREEN'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('username = $userName\npassword= $password'),
          ElevatedButton(onPressed: (){
            GoRouter.of(context).pushNamed(RouteConstants.kDetailsRouteName);
          }, child:const Text('details screen')),
          ElevatedButton(onPressed: (){
            GoRouter.of(context).pushNamed(RouteConstants.kHomeRouteName);
          }, child:const Text('home screen')),
          ElevatedButton(onPressed: (){
            GoRouter.of(context).pushNamed(RouteConstants.kSplashRouteName);
          }, child:const Text('splash screen')),
          ElevatedButton(onPressed: (){
            GoRouter.of(context).pushNamed('sub_details');
          }, child:const Text('sub_details screen')),
          ElevatedButton(onPressed: (){
            GoRouter.of(context).pushNamed('sub_details');
          }, child:const Text('sub_details screen')),
        ],
      ),
    );
  }
}
