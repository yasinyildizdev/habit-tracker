import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/services/get_all_habits.dart';
import 'package:habit_tracker_pre/utils/things/image.dart';
import 'package:habit_tracker_pre/utils/things/routers.dart';
import 'package:habit_tracker_pre/utils/ui/animation.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

int whichHabit = 0;

class HabitsList extends ConsumerWidget {
  const HabitsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureCatFacts = ref.watch(getAllHabitsFProvider);
    return futureCatFacts.when(
        data: (data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.stats.allHabits,
                style: context.myTheme.labelLarge,
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: data.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return SetMyAnimate(
                    startX: 2,
                    startY: 0,
                    duration: (index + 1) * 300,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: _ItemHabit(
                        title: data[index].title,
                        icon: Habits.getIcon(data[index].icon),
                        category: data[index].category,
                        onPressed: () {
                          whichHabit = data[index].id;
                          Navigator.pushNamed(context, info);
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
        error: (err, stack) => Text('Errdsor: $err'),
        loading: (() => const SizedBox()));
  }
}

class _ItemHabit extends StatelessWidget {
  const _ItemHabit(
      {Key? key,
      required this.title,
      required this.category,
      required this.icon,
      required this.onPressed})
      : super(key: key);
  final String title;
  final String icon;
  final String category;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPressed,
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), color: context.myTheme.surfaceGrey),
        width: double.infinity,
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
          ],
        ),
      ),
    );
  }
}
