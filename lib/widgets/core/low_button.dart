import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';

class LowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;

  const LowButton({super.key, required this.onPressed, required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: context.myTheme.lowButtonBackground,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      onPressed: onPressed,
      height: 50,
      minWidth: width,
       highlightElevation: 0, elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
                             