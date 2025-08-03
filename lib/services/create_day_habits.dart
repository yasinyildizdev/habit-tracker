import 'package:habit_tracker_pre/screens/home/day_habits_hive_model.dart';
import 'package:habit_tracker_pre/screens/stats/habits_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';


void createDayHabit(
  int habitId,
  int date,
  String comment,
  String state,
) {
  var dayHabitsBox = Hive.box<DayHabitsHive>('dayHabits');
  var habitsBox = Hive.box<HabitsHive>('habits');
  int newId;
  List x = habitsBox.values.toList();
  if (x.isNotEmpty) {
    newId = x.last.id + 1;
  } else {
    newId = 0;
  }
  dayHabitsBox.add(DayHabitsHive(
    id: newId,
    habitId: habitId,
    comment: comment,
    date: date,
    state: state,
  ));
}
