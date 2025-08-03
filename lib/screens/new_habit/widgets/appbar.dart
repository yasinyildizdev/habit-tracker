import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/common/divider.dart';

class NewHabitAppbar extends StatelessWidget {
  const NewHabitAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          t.newhabit.appbar,
          style: context.myTheme.displaySmall,
        ),
        const SizedBox(height: 10),
        const MyDivider(),
      ],
    );
  }
}
