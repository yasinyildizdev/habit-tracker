import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/screens/stats/widgets/habits_list.dart';

class Stats extends HookWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: const [
              /*     TotalHeatMap(),
                SizedBox(height: 50), */
              HabitsList(),
            ],
          ),
        ),
      ),
    );
  }
}
