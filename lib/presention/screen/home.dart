import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/route.dart';
import '../../utils/string_manager.dart';
import '../widget/custom-now_playing_list.dart';
import '../widget/custom_elevated_button.dart';
import '../widget/custom_search_failed.dart';
import 'change_language.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.home).tr(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          // الانتقال إلى البحث في البيانات
          CustomSearchField(),
          const SizedBox(height: 10),
          // عرض قائمة البيانات
          Expanded(child: NowPlayingList()),
          const SizedBox(height: 20),
          // الانتقال إلى تغيير اللغة
          CustomElevatedButton(
            buttonText: AppString.goto.tr(),
            onPressed: () {
              Navigator.pushNamed(context, Routes.languageScreen);
            },
          ),
        ],
      ),
    );
  }
}



