import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Language { arabic, english }

class LanguageCubit extends Cubit<Language> {
  LanguageCubit() : super(Language.english);
  Language? selectedLanguage;

  Future<void> changeLanguage(
      Language selectedLanguage, BuildContext context) async {
    switch (selectedLanguage) {
      case Language.arabic:
        await EasyLocalization.of(context)!.setLocale(const Locale('ar', 'SA'));
        await _saveLanguage('ar');
        emit(Language.arabic);
        break;
      case Language.english:
        await EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
        await _saveLanguage('en');
        emit(Language.english);
        break;
    }
  }

  Future<void> _saveLanguage(String languageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
  }
}
