/* import 'package:habit_tracker_pre/screens/stats/model_heatmap.dart';
import 'package:habit_tracker_pre/screens/stats/widgets/heatmap.dart';
import 'package:habit_tracker_pre/services/create_day_habits.dart';
import 'package:habit_tracker_pre/services/create_habit.dart';
import 'package:habit_tracker_pre/utils/data/datetime_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final getTotalHeatmapFProvider = FutureProvider.autoDispose((ref) async {
  int month = int.parse(currDate.month.toString().padLeft(2, "0"));
  int year = currDate.year;
  List<DateTime> days = getDaysInMonth(year, month);

  List<TotalHabitHeatmap> statePercent = [];

  int i = 0;
  for (i = 0; i < days.length; i++) {
    int success = 0;
    int total = 0;
    int dbDate = days[i].toDbDate;
    String weekDay = DateFormat("E").format(days[i]);
    var xList = habitsBox.values
        .where((e) =>
            e.start <= dbDate &&
            e.end >= dbDate &&
            e.frequency.contains(weekDay))
        .toList();

    List<int> idList = xList.map<int>((e) => e.id).toList();
    total = idList.length;

    var yList = dayHabitsBox.values
        .where((e) => idList.contains(e.habitId) && e.state == "success")
        .toList();

    success = yList.length;
    if(total<=0){
    statePercent.add(TotalHabitHeatmap(statePercent: 0));
    }else{
    statePercent.add(TotalHabitHeatmap(statePercent: success / (total+1) * 100));
    }
  }

  int x = 0;
  for (x = 0; x < statePercent.length; x++) {
    print(statePercent[x].statePercent);
  }

  return statePercent;
});

List<DateTime> getDaysInMonth(int year, int month) {
  List<DateTime> days = [];
  int daysInMonth = DateTime(year, month + 1, 0).day;
  for (var i = 1; i <= daysInMonth; i++) {
    days.add(DateTime(year, month, i));
  }
  return days;
}
 */