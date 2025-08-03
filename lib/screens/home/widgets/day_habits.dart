import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/screens/home/widgets/oneweek.dart';
import 'package:habit_tracker_pre/screens/stats/widgets/habits_list.dart';
import 'package:habit_tracker_pre/services/create_day_habits.dart';
import 'package:habit_tracker_pre/services/get_day_habits.dart';
import 'package:habit_tracker_pre/utils/data/datetime_extensions.dart';
import 'package:habit_tracker_pre/utils/things/icons.dart';
import 'package:habit_tracker_pre/utils/things/image.dart';
import 'package:habit_tracker_pre/utils/ui/animation.dart';
import 'package:habit_tracker_pre/utils/things/routers.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/core/high_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

String _complateComment = "";

class DayHabits extends ConsumerWidget {
  const DayHabits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureCatFacts = ref.watch(getDayHabitsFProvider);
    return futureCatFacts.when(
        data: (data) {
          DateTime currentDate = ref.watch(selectedDate);
          String whenDay = "";
          whenDay = _pickWhenDay(currentDate);
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              currentDate.toMonthDayYear,
              style: context.myTheme.labelLarge,
            ),
            Text(
              whenDay,
              style: context.myTheme.labelLarge.copyWith(color: context.myTheme.icon),
            ),
            const SizedBox(height: 10),
            data.isEmpty
                ? const BlankList()
                : Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return SetMyAnimate(
                          startX: 2,
                          startY: 0,
                          duration:  (index + 1) * 100,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: _ItemHabit(
                              title: data[index].title,
                              icon: Habits.getIcon(data[index].icon),
                              category: data[index].category,
                              state: data[index].state,
                              onPressed: () {
                                whichHabit = data[index].id;
                                Navigator.pushNamed(context, info);
                              },
                              complate: () {
                                if (data[index].state == "unassigned") {
                                  createDailyHabitModal(context, ref, data, index);
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  )
          ]);
        },
        error: (err, stack) => Text('Errdsor: $err'),
        loading: (() => const SizedBox()));
  }

  Future<dynamic> createDailyHabitModal(BuildContext context, ref, data, index) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          DateTime x = ref.watch(selectedDate);
          int currentDate = x.toDbDate;
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  style: context.myTheme.labelMedium,
                  onChanged: (value) {
                    _complateComment = value;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: context.myTheme.surfaceBlue,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: t.home.enterComplete,
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500)),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: HighButton(
                            onPressed: () {
                              if (_complateComment != "") {
                                createDayHabit(data[index].id, currentDate, _complateComment, "success");
                              }
                              Navigator.pop(context);
                              ref.refresh(getDayHabitsFProvider);
                            },
                            text: t.home.success,
                            color: context.myTheme.green,
                            width: double.infinity)),
                    const SizedBox(width: 20),
                    Expanded(
                        child: HighButton(
                            onPressed: () {
                              if (_complateComment != "") {
                                createDayHabit(data[index].id, currentDate, _complateComment, "failure");
                              }
                              Navigator.pop(context);
                              ref.refresh(getDayHabitsFProvider);
                            },
                            text: t.home.failure,
                            color: context.myTheme.red,
                            width: double.infinity)),
                  ],
                )
              ],
            ),
          );
        });
  }
}

class _ItemHabit extends StatelessWidget {
  const _ItemHabit(
      {Key? key,
      required this.title,
      required this.category,
      required this.icon,
      required this.state,
      required this.onPressed,
      required this.complate})
      : super(key: key);
  final String title;
  final String icon;
  final String category;
  final String state;
  final VoidCallback onPressed;
  final VoidCallback complate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPressed,
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), color: context.myTheme.surfaceGrey),
        width: double.infinity,
        child: SlidableAutoCloseBehavior(
          closeWhenOpened: true,
          child: Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                    autoClose: true,
                    flex: 1,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                    onPressed: (context) => complate(),
                    backgroundColor: context.myTheme.blue,
                    foregroundColor: Colors.white,
                    icon: MyIcons.tick,
                    label: t.home.complate),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: context.myTheme.iconBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          icon,
                          width: 40,
                          height: 40,
                        ),
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.myTheme.bodyMedium,
                    ),
                    Text(
                      category,
                      style: context.myTheme.labelMedium,
                    )
                  ],
                ),
                const Spacer(),
                Icon(MyIcons.right,
                    color: state == "success"
                        ? context.myTheme.green
                        : state == "failure"
                            ? context.myTheme.red
                            : context.myTheme.iconBackground),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _pickWhenDay(DateTime currentDate) {
  String result = "";

  DateTime now = DateTime.now();

  if (currentDate.toDbDate == now.toDbDate) {
    result = t.home.today;
  } else if (currentDate.add(const Duration(days: 1)).toDbDate == now.toDbDate) {
    result = t.home.yesterday;
  } else if (currentDate.add(const Duration(days: 1)).toDbDate < now.toDbDate) {
    result = "${now.difference(currentDate).inDays} ${t.home.days} ${t.home.ago}";
  } else if (currentDate.subtract(const Duration(days: 1)).toDbDate == now.toDbDate) {
    result = t.home.tomorrow;
  } else if (currentDate.subtract(const Duration(days: 1)).toDbDate > now.toDbDate) {
    result = "${currentDate.difference(now).inDays + 1} ${t.home.days} ${t.home.later}";
  }
  return result;
}

class BlankList extends StatelessWidget {
  const BlankList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(MyIcons.privacy),
            const SizedBox(height: 20),
            Text(
              t.home.blankList,
              style: context.myTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
