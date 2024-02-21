import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/presention/widget/app.dart';
import 'core/servies/servies_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  ServiesLcator().init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool rememberMe = prefs.getBool('remember_me') ?? false;

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ar', 'SA'),
    ],
    path: 'assets/translation',
    fallbackLocale: const Locale('en', 'US'),
    startLocale: const Locale('en', 'US'),
    child: MyApp(rememberMe: rememberMe),
  ));
}
















