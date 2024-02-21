import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final List<Widget> children;

  const CustomRow({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children,
    );
  }}