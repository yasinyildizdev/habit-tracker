import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';


class WrittenBy extends StatelessWidget {
  const WrittenBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Text(t.privacy.writtenBy,style: context.myTheme.labelMedium,),
        Text(t.privacy.writtenDate,style: context.myTheme.labelMedium,),
      ],),
    );
  }
}