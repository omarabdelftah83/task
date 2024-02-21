import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late SharedPreferences _preferences;
  bool _isCheckedArabic = false; // حالة المربع عند اختيار اللغة العربية
  bool _isCheckedEnglish = false; // حالة المربع عند اختيار اللغة الإنجليزية

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    final languageCode = _preferences.getString('languageCode');
    if (languageCode != null) {
      setState(() {
        if (languageCode == 'ar') {
          _isCheckedArabic = true;
          _isCheckedEnglish = false;
        } else {
          _isCheckedArabic = false;
          _isCheckedEnglish = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_title'.tr()), // استخدم ترجمة العنوان
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              'Change Language',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 100,),
          ListTile(
            title: Text('arabic'.tr()), // ترجمة: العربية
            leading: Checkbox(
              value: _isCheckedArabic,
              onChanged: (bool? value) {
                setState(() {
                  _isCheckedArabic = value!;
                  _isCheckedEnglish = !_isCheckedArabic; // إلغاء تحديد اللغة الإنجليزية
                });
              },
            ),
          ),
          ListTile(
            title: Text('english'.tr()), // ترجمة: الإنجليزية
            leading: Checkbox(
              value: _isCheckedEnglish,
              onChanged: (bool? value) {
                setState(() {
                  _isCheckedEnglish = value!;
                  _isCheckedArabic = !_isCheckedEnglish; // إلغاء تحديد اللغة العربية
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_isCheckedArabic) {
                await _saveLanguage('ar');
                context.setLocale(const Locale('ar', 'SA')); // تغيير اللغة إلى العربية
              } else if (_isCheckedEnglish) {
                await _saveLanguage('en');
                context.setLocale(const Locale('en', 'US')); // تغيير اللغة إلى الإنجليزية
              }
            },
            child: Text('save'.tr()), // ترجمة: حفظ
          ),
        ],
      ),
    );
  }

  Future<void> _saveLanguage(String languageCode) async {
    await _preferences.setString('languageCode', languageCode);
  }
}
