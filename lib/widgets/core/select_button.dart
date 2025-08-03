import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/utils/ui/colors.dart';

class SelectButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final double width;
  final bool isSelect;

  const SelectButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.width,
      required this.isSelect});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          minimumSize: Size(width, 45),
          side: BorderSide(width: 2.0, color: color),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: isSelect == true ? color : Colors.transparent),
      child: Text(
        text,
        style: TextStyle(
            color: isSelect == true ? MyColors.white : color,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
