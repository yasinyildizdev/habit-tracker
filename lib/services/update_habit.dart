import 'package:habit_tracker_pre/screens/stats/habits_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void updateHabit(
  int whichHabit,
  String icon,
  String title,
  String description,
  String category,
  int start,
  int end,
  String time,
  String reminder,
  String type,
  List<String> frequency,
) {
  
  var habitsBox = Hive.box<HabitsHive>('habits');
  var newId = habitsBox.values.firstWhere((habit) => habit.id == whichHabit).id;
  var allDayHabits = habitsBox.values.toList();
  for (int x = 0; x < allDayHabits.length; x++) {
    if (allDayHabits[x].id == whichHabit) {
      habitsBox.put(
          x,
          HabitsHive(
              id: newId,
              icon: icon,
              title: title,
              description: description,
              category: category,
              start: start,
              end: end,
              time: time,
              reminder: reminder,
              type: type,
              frequency: frequency));
      habitsBox.compact();
    }
  }
}
