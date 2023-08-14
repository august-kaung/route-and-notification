import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_and_notification/go_router_testing/route_constants.dart';
import 'package:routing_and_notification/go_router_testing/sample_model/sample_model.dart';
import 'package:routing_and_notification/go_router_testing/screens/details_screen.dart';
import 'package:routing_and_notification/go_router_testing/screens/error_screen.dart';
import 'package:routing_and_notification/go_router_testing/screens/home_screen.dart';
import 'package:routing_and_notification/go_router_testing/screens/login_screen.dart';
import 'package:routing_and_notification/go_router_testing/screens/normal_screen.dart';
import 'package:routing_and_notification/go_router_testing/screens/splash_screen.dart';
import 'package:routing_and_notification/go_router_testing/screens/sub_details_screen.dart';
import 'package:routing_and_notification/go_router_testing/screens/sub_details_screen_two.dart';

class RouteHelper {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter goRoute = GoRouter(
        initialLocation: '/',
        routes: [
          ///Normal Set Up
          GoRoute(
              name: RouteConstants.kHomeRouteName,
              path: '/',
              pageBuilder: (context, state) {
                return MaterialPage(child: HomeScreen());
              }),
          GoRoute(
              name: 'normal_screen',
              path: '/normal_screen',
              pageBuilder: (context, state) {
                return const MaterialPage(child: NormalScreen());
              }),

          ///Set up with a parameter
          GoRoute(
            name: RouteConstants.kDetailsRouteName,
            path: '/details/:data',
            pageBuilder: (context, state) {
              return MaterialPage(
                  child: DetailsScreen(
                data: state.pathParameters['data']!,
              ));
            },
          ),

          //Set up with child route
          GoRoute(
              name: 'sub_details',
              path: '/sub_details',
              pageBuilder: (context, state) {
                return const MaterialPage(child: SubDetailsScreen());
              },
              routes: [
                GoRoute(
                    name: 'sub_details_two',
                    path: 'sub_details_two',
                    pageBuilder: (context, state) {
                      return const MaterialPage(child: SubDetailsScreenTwo());
                    })
              ]),

          ///Set up with query parameters
          GoRoute(
              name: RouteConstants.kLoginRouteName,
              path: '/login',
              pageBuilder: (context, state) {
                final userName = state.uri.queryParameters['userName']!;
                final password = state.uri.queryParameters['password']!;
                return MaterialPage(
                    child: LoginScreen(userName: userName, password: password));
              }),

          ///Set up with model(objects)
          GoRoute(
              name: RouteConstants.kSplashRouteName,
              path: '/splash',
              pageBuilder: (context, state) {
                List<SampleModel> sampleModelObject =
                    state.extra as List<SampleModel>;
                return MaterialPage(
                    child: SplashScren(sampleModel: sampleModelObject));
              })
        ],
        errorPageBuilder: (context, state) {
          return const MaterialPage(child: ErrorScreen());
        },
        redirect: (context, state) {
          if (!isAuth) {
            return '/normal_screen';
          } else {
            return null;
          }
        });
    return goRoute;
  }
}
