import 'package:habit_tracker_pre/screens/home/day_habits_hive_model.dart';
import 'package:habit_tracker_pre/screens/info/model_heatmap.dart';
import 'package:habit_tracker_pre/screens/info/widgets/heatmap.dart';
import 'package:habit_tracker_pre/screens/stats/widgets/habits_list.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getHabitHeatmapFProvider = FutureProvider.autoDispose((ref) async {
  var dayHabitsBox = Hive.box<DayHabitsHive>('dayHabits');
  String month = currDate.month.toString().padLeft(2, "0");
  String year = currDate.year.toString();
  String whichMonth = "$year$month";

  var x = dayHabitsBox.values
      .where((e) =>
          e.habitId == whichHabit && e.date.toString().contains(whichMonth))
      .toList();

  DateTime firstDayOfMonth =
      DateTime(currDate.year, currDate.month, 1); //Ayın 1. günü

  int first = firstDayOfMonth.weekday; //Ayın 1.günün denk geldiği gün sırası

  /* int lastDayNum =
      DateTime(currDate.year, currDate.month + 1, 0).day; */ //Ayın bitiş günü

  List<HabitHeatmap> result = [];

  result = List.generate(
      36, (index) => HabitHeatmap(state: "unassigned", comment: "a"));

  int q = 0;
  for (q = 0; q < x.length; q++) {
    int eklenecekIndex = int.parse(x[q].date.toString().substring(6, 8));
    result[eklenecekIndex + first - 2] =
        HabitHeatmap(state: x[q].state, comment: x[q].comment);
  }

  return result;
});
