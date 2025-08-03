// ignore_for_file: depend_on_referenced_packages

import 'package:habit_tracker_pre/screens/home/day_habits_hive_model.dart';
import 'package:habit_tracker_pre/screens/home/model.dart';
import 'package:habit_tracker_pre/screens/home/widgets/oneweek.dart';
import 'package:habit_tracker_pre/screens/stats/habits_hive_model.dart';
import 'package:habit_tracker_pre/utils/data/datetime_extensions.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final getDayHabitsFProvider = FutureProvider.autoDispose((ref) async {
  var dayHabitsBox = Hive.box<DayHabitsHive>('dayHabits');
  var habitsBox = Hive.box<HabitsHive>('habits');
  
  DateTime date = ref.watch(selectedDate);

  int dbDate = date.toDbDate;
  String weekDay = DateFormat("E","en_US").format(date);

  //Burada tüm verileri seçmiş sadece icon, title falan seçsin o şekilde ayarla.
  var xList = habitsBox.values
      .where((habit) =>
          habit.start <= dbDate &&
          habit.end >= dbDate &&
          habit.frequency.contains(weekDay.toLowerCase()))
      .toList();

  List<int> idList = xList.map<int>((e) => e.id).toList();

  var yList = dayHabitsBox.values
      .where((e) =>
          idList.contains(e.habitId) && e.date == dbDate)
      .toList();

  List<DayHabits> result = [];

  int i = 0;
  for (i = 0; i < xList.length; i++) {
    String state;
    try {
      state = yList.firstWhere((e) => e.habitId == xList[i].id).state;
    } catch (e) {
      state = "unassigned";
    }
    result.add(
      DayHabits(
        id: xList[i].id,
        icon: xList[i].icon,
        title: xList[i].title,
        category: xList[i].category,
        state: state,
      ),
    );
  }

  return result;
});