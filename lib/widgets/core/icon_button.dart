import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({Key? key, required this.icon, required this.onPressed}) : super(key: key);
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ));
  }
}