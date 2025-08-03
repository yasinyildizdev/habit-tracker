import 'package:habit_tracker_pre/screens/home/day_habits_hive_model.dart';
import 'package:habit_tracker_pre/screens/stats/habits_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void deleteHabit(int whichHabit) {
  var dayHabitsBox = Hive.box<DayHabitsHive>('dayHabits');
  var habitsBox = Hive.box<HabitsHive>('habits');
  
  var allDayHabits = dayHabitsBox.values.toList();
  for (int x = 0; x < allDayHabits.length; x++) {
    if (allDayHabits[x].habitId == whichHabit) {
      dayHabitsBox.deleteAt(x);
      habitsBox.compact();
    }
  }

  var allHabits = habitsBox.values.toList();

  for (int i = 0; i < allHabits.length; i++) {
    if (allHabits[i].id == whichHabit) {
      habitsBox.deleteAt(i);
      habitsBox.compact();
      break;
    }
  }
}