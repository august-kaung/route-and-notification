import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_and_notification/go_router_testing/route_constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key,required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('DETAILS SCREEN'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(data),
          ElevatedButton(
              onPressed: () {
                context.go('sub_details');
              },

              child: const Text('sub_details screen')),
          ElevatedButton(onPressed: (){
            GoRouter.of(context).go('/');
          }, child:const Text('home screen')),
          ElevatedButton(onPressed: (){
            GoRouter.of(context).pushNamed(RouteConstants.kLoginRouteName);
          }, child:const Text('login screen')),
          ElevatedButton(onPressed: (){
            GoRouter.of(context).pushNamed(RouteConstants.kSplashRouteName);
          }, child:const Text('splash screen')),
        ],
      ),
    );
  }
}
