import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/screens/info/widgets/infos.dart';
import 'package:habit_tracker_pre/utils/data/db_keys.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';

List<String> dbFrequency = [];

class FrequencySelect extends HookWidget {
  const FrequencySelect({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> frequency = [
      t.newhabit.monday,
      t.newhabit.tuesday,
      t.newhabit.wednesday,
      t.newhabit.thursday,
      t.newhabit.friday,
      t.newhabit.saturday,
      t.newhabit.sunday,
    ];
    final selectedFrequency = useState<List<String>>(isEdit==true?editHabitValues['frequency']: []);
    dbFrequency = selectedFrequency.value;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.newhabit.frequency,
            style: context.myTheme.labelMedium,
          ),
          const SizedBox(height: 10),
          Wrap(
            direction: Axis.horizontal,
            children: frequency.asMap().entries.map((entry) {
              int index = entry.key;
              return _FrequencyItem(
                onChanged: (value) {
                  if (dbFrequency.contains(frequencyKeys[index])) {
                    dbFrequency = selectedFrequency.value = [
                      ...selectedFrequency.value..remove(frequencyKeys[index])
                    ];
                  } else {
                    dbFrequency = selectedFrequency.value = [
                      ...selectedFrequency.value..add(frequencyKeys[index])
                    ];
                  }
                },
                isSelected: selectedFrequency.value.contains(frequencyKeys[index]),
                text: frequency[index],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _FrequencyItem extends StatelessWidget {
  final ValueChanged onChanged;
  final bool isSelected;
  final String text;

  const _FrequencyItem({required this.onChanged, required this.isSelected, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        onChanged;
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
                splashRadius: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                value: isSelected,
                onChanged: onChanged),
            Text(
              text,
              style: context.myTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
