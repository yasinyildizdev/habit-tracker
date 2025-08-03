import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';

class IntroAppbar extends StatelessWidget {
  const IntroAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(children: [
        Image.asset(
          "assets/images/logo/habiter.png",
          width: 30,
          height: 30,
        ),
        const SizedBox(width: 10),
        Image.asset(
          "assets/images/logo/typetek.png",
          width: 30,
          height: 30,
        ),
        const SizedBox(width: 10),
        Text(t.intro.appbar, style: context.myTheme.displaySmall),
      ]),
    );
  }
}
