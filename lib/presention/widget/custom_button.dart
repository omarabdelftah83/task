
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.color, required this.title, required this.onPressed});

  final Color color;
  final String title;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(left: 60,right: 60),
      child: Material(
        elevation: 10,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
            onPressed: onPressed,
            height: 42,
            minWidth: 200,
            child: Text(title,style: const TextStyle(color: Colors.white),)),
      ),
    );

  }
}