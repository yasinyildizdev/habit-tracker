// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/utils/data/datetime_extensions.dart';
import 'package:habit_tracker_pre/utils/things/icons.dart';
import 'package:habit_tracker_pre/utils/ui/animation.dart';
import 'package:habit_tracker_pre/utils/ui/context_extensions.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/core/icon_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final selectedDate = StateProvider<DateTime>((ref) => DateTime.now());

class OneWeek extends HookConsumerWidget {
  const OneWeek({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double itemWidth = (context.dynamicWidth(1) - context.dynamicWidth(0.02) - 30) / 7;
    final first = useState(DateTime.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t.home.thisWeek,
              style: context.myTheme.labelLarge,
            ),
            Row(
              children: [
                MyIconButton(
                    onPressed: () {
                      first.value = first.value.subtract(const Duration(days: 7));
                    },
                    icon: Icon(
                      MyIcons.left,
                      size: 20,
                      color: context.myTheme.icon,
                    )),
                MyIconButton(
                    onPressed: () {
                      first.value = first.value.add(const Duration(days: 7));
                    },
                    icon: Icon(
                      MyIcons.right,
                      size: 20,
                      color: context.myTheme.icon,
                    )),
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: context.dynamicWidth(1.5 / 8),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemExtent: itemWidth,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return SetMyAnimate(
                startX: 0,
                startY: -3,
                duration: index * 150,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: _OneWeekItem(
                      onPressed: () {
                        ref.read(selectedDate.notifier).state =
                            _firstDayOfWeek(first.value).add(Duration(days: index));
                      },
                      date: _firstDayOfWeek(first.value).add(Duration(days: index))),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _OneWeekItem extends ConsumerWidget {
  const _OneWeekItem({Key? key, required this.onPressed, required this.date}) : super(key: key);
  final DateTime date;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String weekName = DateFormat("E").format(date);
    String weekNumber = DateFormat("d").format(date);
    int whichWeekItem = ref.watch(selectedDate).toDbDate;

    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
            color: whichWeekItem == date.toDbDate ? context.myTheme.blue : context.myTheme.surfaceGrey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                weekName,
                style: context.myTheme.labelMedium.copyWith(
                    color: whichWeekItem == date.toDbDate ? Colors.white : context.myTheme.text),
              ),
              Text(
                weekNumber,
                style: context.myTheme.labelMedium.copyWith(
                    color: whichWeekItem == date.toDbDate ? Colors.white : context.myTheme.text),
              ),
            ],
          )),
    );
  }
}

DateTime _firstDayOfWeek(DateTime date) {
  DateTime firstDayOfWeek = date.subtract(Duration(days: date.weekday - 1));
  return firstDayOfWeek;
}
