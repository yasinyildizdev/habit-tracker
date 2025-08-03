import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/screens/home/widgets/day_habits.dart';
import 'package:habit_tracker_pre/screens/home/widgets/oneweek.dart';

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            OneWeek(),
            SizedBox(height: 20),
            Expanded(child: DayHabits()),
          ],
        ),
      ),
    );
  }
}
