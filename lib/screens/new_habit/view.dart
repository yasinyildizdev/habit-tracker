import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/appbar.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/date_time_select.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/form_select.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/frequency_select.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/icon_select.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/create_button.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/reminder.dart';
import 'package:habit_tracker_pre/screens/new_habit/widgets/type_select.dart';

class NewHabit extends HookWidget {
  const NewHabit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: const  BoxDecoration(
            borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(202),
                  ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NewHabitAppbar(),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    child: Column(
                      children: const [
                        IconSelect(),
                        SizedBox(height: 10),
                        FormSelect(),
                        SizedBox(height: 10),
                        DateTimeSelect(),
                        SizedBox(height: 10),
                        ReminderSelect(),
                        SizedBox(height: 10),
                        TypeSelect(),
                        SizedBox(height: 10),
                        FrequencySelect(),
                        SizedBox(height: 10),
                        CreateButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}