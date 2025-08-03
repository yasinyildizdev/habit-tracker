import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/screens/info/widgets/infos.dart';
import 'package:habit_tracker_pre/utils/data/db_keys.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/core/select_button.dart';

String dbReminder = '';

class ReminderSelect extends HookWidget {
  const ReminderSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> reminderTimes = [
      t.newhabit.before5m,
      t.newhabit.before30m,
      t.newhabit.before1h,
      t.newhabit.onTime,
      t.newhabit.disable
    ];
    final selectedReminder = useState(isEdit == true ? editHabitValues['reminder'] : '');
    dbReminder = selectedReminder.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.newhabit.reminder,
          style: context.myTheme.labelMedium,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 45,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: reminderTimes.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SelectButton(
                    onPressed: () {
                      dbReminder = selectedReminder.value = reminderKeys[index];
                    },
                    text: reminderTimes[index],
                    color: context.myTheme.blue,
                    width: double.minPositive,
                    isSelect: reminderKeys[index] == selectedReminder.value ? true : false),
              );
            },
          ),
        ),
      ],
    );
  }
}
