import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';

class TopText extends StatelessWidget {
  const TopText({Key? key, required this.type}) : super(key: key);
  final TopTextType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          type==TopTextType.login
          ?t.login.title
          :t.register.title ,style: context.myTheme.displayMedium,textAlign: TextAlign.center,),
        const SizedBox(height: 10),
        Text(
          type==TopTextType.login
          ?t.login.text
          :t.register.text ,style: context.myTheme.bodyLarge, textAlign: TextAlign.center,)
        ],
    );
  }
}

enum TopTextType{
  login,
  register
}