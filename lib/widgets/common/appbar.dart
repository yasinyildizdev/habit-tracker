import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/utils/things/icons.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/common/divider.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                splashRadius: 20,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(MyIcons.back)),
            const SizedBox(width: 10),
            Text(
              text,
              style: context.myTheme.displaySmall,
            ),
          ],
        ),
        const MyDivider(),
      ],
    );
  }
}

