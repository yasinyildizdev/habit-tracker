// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/screens/info/model_heatmap.dart';
import 'package:habit_tracker_pre/services/get_habit_heatmap.dart';
import 'package:habit_tracker_pre/utils/things/icons.dart';
import 'package:habit_tracker_pre/utils/ui/context_extensions.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

DateTime currDate = DateTime.now();

class HeatMap extends HookConsumerWidget {
  const HeatMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> weekNames = [
  DateFormat("EE").format(DateTime.parse("20000103")),
  DateFormat("EE").format(DateTime.parse("20000104")),
  DateFormat("EE").format(DateTime.parse("20000105")),
  DateFormat("EE").format(DateTime.parse("20000106")),
  DateFormat("EE").format(DateTime.parse("20000107")),
  DateFormat("EE").format(DateTime.parse("20000108")),
  DateFormat("EE").format(DateTime.parse("20000109")),
];
    final futureCatFacts = ref.watch(getHabitHeatmapFProvider);
    final currentDate = useState(currDate);
    String currentMonth = DateFormat(
      "MMMM yyyy",
    ).format(currentDate.value);
    return SizedBox(
      width: context.dynamicWidth(0.75),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  currentDate.value = currDate = DateTime(
                      currentDate.value.year,
                      currentDate.value.month - 1,
                      currentDate.value.day);
                  ref.refresh(getHabitHeatmapFProvider);
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: context.myTheme.icon,
                        )),
                    child:  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(MyIcons.left, size: 15,color: context.myTheme.icon),
                    )),
              ),
              Text(
                currentMonth,
                style: context.myTheme.titleMedium,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  currentDate.value = currDate = DateTime(
                      currentDate.value.year,
                      currentDate.value.month + 1,
                      currentDate.value.day);
                  ref.refresh(getHabitHeatmapFProvider);
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: context.myTheme.icon,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        MyIcons.right,
                        size: 15,
                        color: context.myTheme.icon,
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                weekNames.length,
                (index) => SizedBox(
                    width: context.dynamicWidth(0.75) / 7,
                    child: ItemWeekDay(weekDayText: weekNames[index])),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            color: Colors.transparent,
            height: (context.dynamicWidth(0.75) / 7) * 6,
            child: futureCatFacts.when(
              data: (data) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                  ),
                  itemCount: 36,
                  itemBuilder: (BuildContext context, int index) {
                    return futureCatFacts.when(
                      data: (data) {
                        return ItemHeatmap(
                          state: data[index].state,
                          text: index + firstDayNumFinder(currentDate.value),
                          onPressed: () {
                            _showComplateComment(context, data, index);
                          },
                        );
                      },
                      error: (err, stack) => Text('Errdsor: $err'),
                      loading: (() => Container(
                            width: 200,
                            height: 200,
                            color: Colors.red,
                          )),
                    );
                  },
                );
              },
              error: (err, stack) => Text('Errdsor: $err'),
              loading: (() => Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showComplateComment(BuildContext context, List<HabitHeatmap> data, int index) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            t.info.complateComment,
                            style: context.myTheme.labelMedium
                          ),
                          const SizedBox(height: 10),
                          Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: context.myTheme.surfaceBlue),
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.info,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(child: Text(data[index].comment,style: context.myTheme.labelMedium,))
                                ],
                              )),
                        ],
                      ),
        );
      });
  }
}

class ItemHeatmap extends StatelessWidget {
  const ItemHeatmap(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.state})
      : super(key: key);
  final int text;
  final String state;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    int lastDayNum = DateTime(currDate.year, currDate.month + 1, 0)
        .day; //Ayın integer şeklinde bitiş günü
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: text <= 0 || text > lastDayNum
          ? const SizedBox()
          : InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: onPressed,
              child: Ink(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: state == "success"
                        ? context.myTheme.green
                        : state == "failure"
                            ? context.myTheme.red
                            : context.myTheme.surfaceGrey),
                child: Center(
                    child: Text(
                  text.toString(),
                  style:
                      context.myTheme.labelMedium.copyWith(color: Colors.white),
                )),
              ),
            ),
    );
  }
}

class ItemWeekDay extends StatelessWidget {
  const ItemWeekDay({Key? key, required this.weekDayText}) : super(key: key);
  final String weekDayText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(weekDayText, style: context.myTheme.labelMedium),
    );
  }
}

int firstDayNumFinder(DateTime currentDate) {
  int num = 0;

  DateTime firstDayOfMonth =
      DateTime(currentDate.year, currentDate.month, 1); //Ayın 1. günü
  int firstWeekDayOfMonth =
      firstDayOfMonth.weekday; //Ayın 1.günün denk geldiği gün sırası

  if (firstWeekDayOfMonth == 1) {
    num = 1;
  }

  if (firstWeekDayOfMonth == 2) {
    num = 0;
  }

  if (firstWeekDayOfMonth == 3) {
    num = -1;
  }

  if (firstWeekDayOfMonth == 4) {
    num = -2;
  }

  if (firstWeekDayOfMonth == 5) {
    num = -3;
  }

  if (firstWeekDayOfMonth == 6) {
    num = -4;
  }

  if (firstWeekDayOfMonth == 7) {
    num = -5;
  }
  return num;
}
