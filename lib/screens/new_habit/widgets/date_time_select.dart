import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/screens/info/widgets/infos.dart';
import 'package:habit_tracker_pre/utils/data/datetime_extensions.dart';
import 'package:habit_tracker_pre/utils/things/icons.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';

DateTime dbStart = DateTime(0);
DateTime dbEnd = DateTime(0);
DateTime dbTime = DateTime(0);

class DateTimeSelect extends HookWidget {
  const DateTimeSelect({super.key});
  @override
  Widget build(BuildContext context) {
    var x = DateTime.now();

    final startDate = useState(isEdit == true
        ? DateTime.parse(editHabitValues['start_date'].toString().monthDayYeartoDateTime.toString())
        : DateTime(0));
    final endDate = useState(isEdit == true
        ? DateTime.parse(editHabitValues['end_date'].toString().monthDayYeartoDateTime.toString())
        : DateTime(0));
    final time = useState(isEdit == true
        ? DateTime(x.year, x.month, x.day, int.parse(editHabitValues['time'].toString().split(':')[0]),
             int.parse(editHabitValues['time'].toString().split(':')[1]))
        : DateTime(0));
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: _DateTimePicker(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                          height: 250,
                          child: CupertinoDatePicker(
                              backgroundColor: Colors.white,
                              initialDateTime: DateTime.now(),
                              use24hFormat: true,
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (DateTime newDate) {
                                dbStart = startDate.value = newDate;
                              }),
                        ));
              },
              hint: t.newhabit.startHint,
              text: startDate.value,
              label: t.newhabit.start,
              type: DateOrTime.date,
            )),
            const SizedBox(width: 10),
            Expanded(
                child: _DateTimePicker(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                          height: 250,
                          child: CupertinoDatePicker(
                              backgroundColor: Colors.white,
                              initialDateTime: DateTime.now(),
                              use24hFormat: true,
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (DateTime newDate) {
                                dbEnd = endDate.value = newDate;
                              }),
                        ));
              },
              hint: t.newhabit.endHint,
              text: endDate.value,
              label: t.newhabit.end,
              type: DateOrTime.date,
            )),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child: _DateTimePicker(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                          height: 250,
                          child: CupertinoDatePicker(
                              backgroundColor: Colors.white,
                              initialDateTime: DateTime.now(),
                              use24hFormat: true,
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: (DateTime newTime) {
                                dbTime = time.value = newTime;
                              }),
                        ));
              },
              hint: t.newhabit.timeHint,
              text: time.value,
              label: t.newhabit.time,
              type: DateOrTime.time,
            )),
          ],
        )
      ],
    );
  }
}

class _DateTimePicker extends StatelessWidget {
  const _DateTimePicker(
      {Key? key,
      required this.text,
      this.type = DateOrTime.date,
      required this.label,
      required this.hint,
      required this.onTap})
      : super(key: key);
  final DateTime text;
  final String label;
  final DateOrTime type;
  final String hint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.myTheme.labelMedium,
        ),
        const SizedBox(height: 10),
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                border: Border.all(width: 1, color: context.myTheme.stroke)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text == DateTime(0)
                      ? hint
                      : type == DateOrTime.date
                          ? text.toMonthDayYear
                          : text.toHourMinute,
                  style: text == DateTime(0)
                      ? context.myTheme.labelMedium.copyWith(color: context.myTheme.shadeText)
                      : context.myTheme.labelMedium,
                ),
                Icon(type == DateOrTime.date ? MyIcons.calendar : MyIcons.info,
                    color: context.myTheme.icon)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum DateOrTime {
  date,
  time,
}
