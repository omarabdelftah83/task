import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/route.dart';
import '../../utils/string_manager.dart';
import '../widget/custom-now_playing_list.dart';
import '../widget/custom_elevated_button.dart';
import '../widget/custom_search_failed.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.home).tr(),
      ),
      body: LayoutBuilder(builder: (context ,size){
       return   SizedBox(
         width: size.maxWidth>500?400:400,
         height: size.maxHeight>700?600:600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                ///custom search field ..//
                CustomSearchField(),
                const SizedBox(height: 10),
                ///custom now playing list..//
                Expanded(child: NowPlayingList()),
                const SizedBox(height: 20),
                ///custom elevated button ..//
                CustomElevatedButton(
                  buttonText: AppString.goto.tr(),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.languageScreen);
                  },
                ),
              ],
            ),
          );
        },

      ),
    );
  }
}