import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/screens/info/widgets/infos.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/date_time_select.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/form_select.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/frequency_select.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/icon_select.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/reminder.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/type_select.dart';
import 'package:habit_tracker_pre/screens/stats/widgets/habits_list.dart';
import 'package:habit_tracker_pre/services/create_habit.dart';
import 'package:habit_tracker_pre/services/get_all_habits.dart';
import 'package:habit_tracker_pre/services/get_day_habits.dart';
import 'package:habit_tracker_pre/services/get_habit_info.dart';
import 'package:habit_tracker_pre/services/update_habit.dart';
import 'package:habit_tracker_pre/utils/data/datetime_extensions.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/common/snackbar.dart';
import 'package:habit_tracker_pre/widgets/core/high_button.dart';
import 'package:habit_tracker_pre/widgets/core/low_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateButton extends ConsumerWidget {
  const CreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: LowButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: t.newhabit.cancel,
              width: double.infinity),
        ),
        const SizedBox(width: 10),
        isEdit == true
            ? Expanded(
                child: HighButton(
                    onPressed: () {
                      if (dbIcon.isNotEmpty &&
                          dbTitle.isNotEmpty &&
                          dbDescription.isNotEmpty &&
                          dbCategory.isNotEmpty &&
                          dbStart != DateTime(0) &&
                          dbEnd != DateTime(0) &&
                          dbTime != DateTime(0) &&
                          dbReminder.isNotEmpty &&
                          dbType.isNotEmpty &&
                          dbFrequency.isNotEmpty) {
                        if (dbCategory.length > 20) {
                          mySnackbar(context, t.newhabit.snackbar.categoryCannotLong);
                        } else {
                          if (dbTitle.length > 25) {
                            mySnackbar(context, t.newhabit.snackbar.titleCannotLong);
                          } else {
                            updateCurrentHabit();
                            ref.refresh(getAllHabitsFProvider);
                            ref.refresh(getDayHabitsFProvider);
                            ref.refresh(getHabitInfoFProvider);
                            Navigator.pop(context);
                          }
                        }
                      } else {
                        mySnackbar(context, t.newhabit.snackbar.blankMustFilled);
                      }
                    },
                    text: t.newhabit.edit,
                    color: context.myTheme.blue,
                    width: double.infinity))
            : Expanded(
                child: HighButton(
                    onPressed: () {
                      if (dbIcon.isNotEmpty &&
                          dbTitle.isNotEmpty &&
                          dbDescription.isNotEmpty &&
                          dbCategory.isNotEmpty &&
                          dbStart != DateTime(0) &&
                          dbEnd != DateTime(0) &&
                          dbTime != DateTime(0) &&
                          dbReminder.isNotEmpty &&
                          dbType.isNotEmpty &&
                          dbFrequency.isNotEmpty) {
                        if (dbCategory.length > 20) {
                          mySnackbar(context, t.newhabit.snackbar.categoryCannotLong);
                        } else {
                          if (dbTitle.length > 25) {
                            mySnackbar(context, t.newhabit.snackbar.titleCannotLong);
                          } else {
                            if (dbCategory == "LOOP") {
                              for (int i = 0; i < int.parse(dbDescription); i++) {
                                createNewHabit();
                              }
                            }
                            ref.refresh(getAllHabitsFProvider);
                            ref.refresh(getDayHabitsFProvider);
                            Navigator.pop(context);
                          }
                        }
                      } else {
                        mySnackbar(context, t.newhabit.snackbar.blankMustFilled);
                      }
                    },
                    text: t.newhabit.create,
                    color: context.myTheme.blue,
                    width: double.infinity)),
      ],
    );
  }

  void createNewHabit() => createHabit(dbIcon, dbTitle, dbDescription, dbCategory, dbStart.toDbDate,
      dbEnd.toDbDate, dbTime.toDbTime, dbReminder, dbType, dbFrequency);

  void updateCurrentHabit() => updateHabit(whichHabit, dbIcon, dbTitle, dbDescription, dbCategory,
      dbStart.toDbDate, dbEnd.toDbDate, dbTime.toDbTime, dbReminder, dbType, dbFrequency);
}
