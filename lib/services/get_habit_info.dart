import 'package:habit_tracker_pre/screens/info/model_infos.dart';
import 'package:habit_tracker_pre/screens/stats/habits_hive_model.dart';
import 'package:habit_tracker_pre/screens/stats/widgets/habits_list.dart';
import 'package:habit_tracker_pre/utils/data/datetime_extensions.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getHabitInfoFProvider = FutureProvider.autoDispose((ref) async {
  var habitsBox = Hive.box<HabitsHive>('habits');
  var habitInfo = habitsBox.values.firstWhere((habit) => habit.id == whichHabit);

  var result = HabitInfo(
      id: habitInfo.id,
      title: habitInfo.title,
      description: habitInfo.description,
      endDate: habitInfo.end.dbToMonthDayYear,
      startDate: habitInfo.start.dbToMonthDayYear,
      reminder: habitInfo.reminder,
      type: habitInfo.type,
      icon: habitInfo.icon,
      category: habitInfo.category,
      time: habitInfo.time.dbtoHourMinute,
      frequency: habitInfo.frequency);

  return result;
});
