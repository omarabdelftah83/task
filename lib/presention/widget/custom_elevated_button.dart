import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    required this.buttonText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // لون الخلفية
          onPrimary: Colors.white, // لون النص
         // المسافات الداخلية
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // شكل الحواف
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 16), // حجم النص
        ),
      ),
    );
  }
}
