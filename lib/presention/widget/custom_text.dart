import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}