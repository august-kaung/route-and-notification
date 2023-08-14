import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_and_notification/go_router_testing/route_constants.dart';
import 'package:routing_and_notification/go_router_testing/sample_model/sample_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  String home = 'Catherine';
  String username = 'John Snow';
  String password = "John Snow's Password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME SCREEN'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///Work with a parameter
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(RouteConstants.kDetailsRouteName,
                    pathParameters: {'data': home});
              },
              child: const Text('details screen')),

          ///Normal
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed('normal_screen');
              },
              child: const Text(' screen')),
          ///Normal
          ElevatedButton(
              onPressed: () {
                context.pushNamed('sub_details');
              },
              child: const Text('sub_details screen')),

          ///Work with query parameters
          ElevatedButton(
              onPressed: () {
                context.pushNamed(RouteConstants.kLoginRouteName,
                    queryParameters: {
                      'userName': username,
                      'password': password
                    });
              },
              child: const Text('login screen')),

          ///Work with model
          ElevatedButton(
              onPressed: () {
                List<SampleModel> modelObject = [
                  SampleModel(
                      name: 'Kaung Htet',
                      address: 'SouthOakkalar',
                      phNumber: 098746215624),
                  SampleModel(
                      name: 'Kaung Kaung',
                      address: 'Tamwe',
                      phNumber: 098746215624),
                  SampleModel(
                      name: 'Htet Htet',
                      address: 'Yangon',
                      phNumber: 098746215624)
                ];
                GoRouter.of(context).pushNamed(RouteConstants.kSplashRouteName,
                    extra: modelObject);
              },
              child: const Text('splash screen')),
        ],
      ),
    );
  }
}
