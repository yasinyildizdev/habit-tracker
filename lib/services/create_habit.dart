import 'package:habit_tracker_pre/screens/stats/habits_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';



void createHabit(
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
  int newId;
var habitsBox = Hive.box<HabitsHive>('habits');
  List x = habitsBox.values.toList();
  if (x.isNotEmpty) {
    newId = x.last.id+1;
  } else {
    newId = 0;
  }
  habitsBox.add(HabitsHive(
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
}