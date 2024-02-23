import 'package:flutter/material.dart';

class CustomLanguageTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?)? onChanged;

  const CustomLanguageTile({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}