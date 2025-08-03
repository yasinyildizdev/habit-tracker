import 'package:habit_tracker_pre/screens/stats/habits_hive_model.dart';
import 'package:habit_tracker_pre/screens/stats/model_habits.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getAllHabitsFProvider = FutureProvider.autoDispose((ref) async {
  var habitsBox = Hive.box<HabitsHive>('habits');
  var allHabits = habitsBox.values.toList();

  var allHabitsList = allHabits
      .map((habit) => AllHabits(
            id: habit.id,
            title: habit.title,
            icon: habit.icon,
            category: habit.category,
          ))
      .toList();

  return allHabitsList;
});
