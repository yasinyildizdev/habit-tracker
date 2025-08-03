import 'package:flutter/material.dart';

class HighButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final double width;

  const HighButton({super.key, required this.onPressed, required this.text, required this.color, required this.width});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: onPressed,
      height: 50,
      minWidth: width,
       highlightElevation: 0,
            elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
                             