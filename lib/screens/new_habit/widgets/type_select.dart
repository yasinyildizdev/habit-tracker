import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/screens/info/widgets/infos.dart';
import 'package:habit_tracker_pre/utils/data/db_keys.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/core/select_button.dart';

String dbType = '';

class TypeSelect extends HookWidget {
  const TypeSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedType = useState(isEdit == true ? editHabitValues['type'] : '');
    dbType = selectedType.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.newhabit.type,
          style: context.myTheme.labelMedium,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: SelectButton(
                  onPressed: () {
                    dbType = selectedType.value = typeKeys[0];
                  },
                  text: t.newhabit.toDo,
                  color: context.myTheme.blue,
                  width: double.infinity,
                  isSelect: typeKeys[0] == selectedType.value ? true : false),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SelectButton(
                  onPressed: () {
                    dbType = selectedType.value = typeKeys[1];
                  },
                  text: t.newhabit.notToDo,
                  color: context.myTheme.blue,
                  width: double.infinity,
                  isSelect: typeKeys[1] == selectedType.value ? true : false),
            ),
          ],
        ),
      ],
    );
  }
}
