import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/services/delete_habit.dart';
import 'package:habit_tracker_pre/services/get_all_habits.dart';
import 'package:habit_tracker_pre/services/get_day_habits.dart';
import 'package:habit_tracker_pre/services/get_habit_info.dart';
import 'package:habit_tracker_pre/utils/data/db_keys.dart';
import 'package:habit_tracker_pre/utils/things/icons.dart';
import 'package:habit_tracker_pre/utils/things/image.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/core/high_button.dart';
import 'package:habit_tracker_pre/widgets/core/icon_button.dart';
import 'package:habit_tracker_pre/screens/-main/view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';


Map<String, dynamic> editHabitValues = {};
bool isEdit = false;

class Infos extends ConsumerWidget {
  const Infos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, String> types = {};
    types['toDo'] = t.info.toDo;
    types['notToDo'] = t.info.notToDo;

    Map<String, String> reminders = {};
    reminders['before5m'] = t.info.before5m;
    reminders['before30m'] = t.info.before30m;
    reminders['before1h'] = t.info.before1h;
    reminders['onTime'] = t.info.onTime;
    reminders['disable'] = t.info.disable;
    final futureCatFacts = ref.watch(getHabitInfoFProvider);
    return futureCatFacts.when(
        data: (data) {
          editHabitValues['icon'] = data.icon;
          editHabitValues['title'] = data.title;
          editHabitValues['description'] = data.description;
          editHabitValues['category'] = data.category;
          editHabitValues['start_date'] = data.startDate;
          editHabitValues['end_date'] = data.endDate;
          editHabitValues['time'] = data.time;
          editHabitValues['reminder'] = data.reminder;
          editHabitValues['type'] = data.type;
          editHabitValues['frequency'] = data.frequency;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: context.myTheme.iconBackground),
                      child: Image.asset(
                        Habits.getIcon(data.icon),
                        width: 40,
                        height: 40,
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 4,
                    child: Text(
                      data.title,
                      style: context.myTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const Spacer(),
                  MyIconButton(
                      icon: const Icon(MyIcons.details),
                      onPressed: () {
                        showEditOrDeleteModal(context, data.id, ref);
                      })
                ],
              ),
              const SizedBox(height: 20),
              _InfoItem(label: t.info.description, text: data.description),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _InfoItem(label: t.info.startDate, text: data.startDate),
                      const SizedBox(height: 10),
                      _InfoItem(label: t.info.category, text: data.category),
                      const SizedBox(height: 10),
                      _InfoItem(label: t.info.time, text: data.time)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _InfoItem(label: t.info.endDate, text: data.endDate),
                      const SizedBox(height: 10),
                      _InfoItem(label: t.info.type, text: types[data.type] ?? 'error'),
                      const SizedBox(height: 10),
                      _InfoItem(label: t.info.reminder, text: reminders[data.reminder] ?? 'error'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(t.info.Frequency,
                  style: context.myTheme.labelSmall.copyWith(color: context.myTheme.shadeText)),
              const SizedBox(height: 5),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  itemCount: 7,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    List<String> freqList = createShowFrequency(data.frequency);
                    return _ItemFrequencyWeek(
                      frequency: freqList[index],
                      index: index,
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (err, stack) => Text('Errdsor: $err'),
        loading: (() => const SizedBox()));
  }

  Future<dynamic> showEditOrDeleteModal(BuildContext context, int id, ref) {
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
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: HighButton(
                            onPressed: () {
                              Navigator.pop(context);
                              isEdit = true;
                              showNewHabitModal(context);
                            },
                            text: t.info.edit,
                            color: context.myTheme.surfaceGrey,
                            width: double.infinity)),
                    const SizedBox(width: 20),
                    Expanded(
                        child: HighButton(
                            onPressed: () {
                              deleteHabit(id);
                              ref.refresh(getAllHabitsFProvider);
                              ref.refresh(getDayHabitsFProvider);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            text: t.info.delete,
                            color: context.myTheme.red,
                            width: double.infinity)),
                  ],
                )
              ],
            ),
          );
        });
  }

  List<String> createShowFrequency(List frequencyList) {
    List<String> newList = ["bl", "bl", "bl", "bl", "bl", "bl", "bl"];
    frequencyList.contains("mon") ? newList[0] = "mon" : {};
    frequencyList.contains("tue") ? newList[1] = "tue" : {};
    frequencyList.contains("wed") ? newList[2] = "wed" : {};
    frequencyList.contains("thu") ? newList[3] = "thu" : {};
    frequencyList.contains("fri") ? newList[4] = "fri" : {};
    frequencyList.contains("sat") ? newList[5] = "sat" : {};
    frequencyList.contains("sun") ? newList[6] = "sun" : {};
    return newList;
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({Key? key, required this.label, required this.text}) : super(key: key);
  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.myTheme.labelSmall.copyWith(color: context.myTheme.shadeText),
        ),
        Text(
          text,
          style: context.myTheme.labelLarge,
        ),
      ],
    );
  }
}

class _ItemFrequencyWeek extends StatelessWidget {
  const _ItemFrequencyWeek({Key? key, required this.frequency, required this.index}) : super(key: key);
  final String frequency;
  final int index;

  @override
  Widget build(BuildContext context) {
      List<String> weekNames = [
  DateFormat("EE").format(DateTime.parse("20000103")),
  DateFormat("EE").format(DateTime.parse("20000104")),
  DateFormat("EE").format(DateTime.parse("20000105")),
  DateFormat("EE").format(DateTime.parse("20000106")),
  DateFormat("EE").format(DateTime.parse("20000107")),
  DateFormat("EE").format(DateTime.parse("20000108")),
  DateFormat("EE").format(DateTime.parse("20000109")),
];
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                frequencyKeys.contains(frequency) ? context.myTheme.blue : context.myTheme.surfaceGrey),
        child: Center(
            child: Text(
          weekNames[index],
          style: context.myTheme.labelMedium
              .copyWith(color: frequencyKeys.contains(frequency) ? Colors.white : context.myTheme.text),
        )),
      ),
    );
  }
}
