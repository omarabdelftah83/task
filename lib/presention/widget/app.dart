import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task/utils/route.dart';

class MyApp extends StatelessWidget {
  final bool rememberMe;
  const MyApp({Key? key, required this.rememberMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: DevicePreview.appBuilder,
        title: 'Ix Solution',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: RouteGenarator.getRoute,
      initialRoute: rememberMe ? Routes.homeRoute : Routes.loginRoute,
    );
  }
}
