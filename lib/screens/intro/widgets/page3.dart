import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/utils/ui/context_extensions.dart';

import 'package:habit_tracker_pre/gen/strings.g.dart';

class Page3W extends StatelessWidget {
  const Page3W({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/blob/blob2.svg", width: MediaQuery.of(context).size.width/2, height: MediaQuery.of(context).size.width/2,),
        const SizedBox(
          height: 30
        ),
        Text(
          t.intro.title2,
          style: context.myTheme.titleMedium
        ),
        const SizedBox(
          height: 20
        ),
        SizedBox(
          width: context.dynamicWidth(0.8),
          child: Text(
            t.intro.text2,
            style: context.myTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
