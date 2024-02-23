import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/language/lang_bloc.dart';
class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: LanguageView(),
    );
  }
}

class LanguageView extends StatefulWidget {
  @override
  _LanguageViewState createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_title'.tr()),
      ),
      body: BlocBuilder<LanguageCubit, Language>(
        builder: (context, state) {
          final cubit = BlocProvider.of<LanguageCubit>(context);
           return   LayoutBuilder(
            builder: (context, size) {

              return SizedBox(
                width: size.maxWidth > 500 ? 400 : 400,
                height: size.maxHeight > 700 ? 600 : 500,
                child: Column(
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
                    const SizedBox(
                      height: 100,
                    ),
                    ListTile(
                      title: Text('arabic'.tr()),
                      leading: Radio(
                        value: Language.arabic,
                        groupValue: cubit.selectedLanguage,
                        onChanged: (value) {
                          setState(() {
                            cubit.selectedLanguage = value as Language;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('english'.tr()),
                      leading: Radio(
                        value: Language.english,
                        groupValue: cubit.selectedLanguage,
                        onChanged: (value) {
                          setState(() {
                            cubit.selectedLanguage = value as Language;
                          });
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // Trigger language change only if a language is selected
                        if (cubit.selectedLanguage != null) {
                          context
                              .read<LanguageCubit>()
                              .changeLanguage(cubit.selectedLanguage!, context);
                        }
                      },
                      child: Text('Save'.tr()),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
