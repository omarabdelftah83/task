import 'package:flutter/material.dart';
import 'package:task/utils/string_manager.dart';

import '../presention/screen/home.dart';
import '../presention/screen/login.dart';

class Routes {

  static const String loginRoute = '/';
  static const String homeRoute = '/home';

}

class RouteGenarator {
  static Route<dynamic> getRoute(RouteSettings sitting) {
    switch (sitting.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>  SignInScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(AppString.noRouteFound),
          ),
        ));
  }
}