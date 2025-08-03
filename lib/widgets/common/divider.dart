import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.3,
      decoration: BoxDecoration(
        color: context.myTheme.divider
      ),
    );
  }
}