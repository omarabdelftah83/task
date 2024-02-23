import 'package:flutter/material.dart';
import 'package:task/utils/string_manager.dart';

import '../presention/screen/change_language.dart';
import '../presention/screen/home.dart';
import '../presention/screen/login.dart';
import '../presention/screen/search_screen/search.dart';

class Routes {

  static const String loginRoute = '/';
  static const String homeRoute = '/home';
  static const String languageScreen = '/LanguageScreen';
  static const String search = '/Search';


}

class RouteGenarator {
  static Route<dynamic> getRoute(RouteSettings sitting) {
    switch (sitting.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.languageScreen:
        return MaterialPageRoute(builder: (_) => LanguageScreen());
      case Routes.search:
        return MaterialPageRoute(builder: (_) => Search());
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