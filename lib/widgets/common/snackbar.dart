import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/utils/things/icons.dart';
import 'package:habit_tracker_pre/utils/ui/colors.dart';

void mySnackbar(BuildContext context, text){
  var snackBar = SnackBar(    
  backgroundColor: DarkColors.black,
  content: Row(
    children: [
      const Icon(MyIcons.info,color: DarkColors.grey),
      const SizedBox(width: 10),
      Text(text, style: const TextStyle(color: Colors.white)),
    ]
  ),
  duration: const Duration(milliseconds: 500),
);
ScaffoldMessenger.of(context).showSnackBar(snackBar);
}