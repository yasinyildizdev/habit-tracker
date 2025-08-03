import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/screens/info/widgets/infos.dart';
import 'package:habit_tracker_pre/widgets/core/my_textfield.dart';

String dbTitle = '';
String dbDescription = '';
String dbCategory = '';

class FormSelect extends HookWidget {
  const FormSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final title = useState(isEdit == true ? editHabitValues['title'] : '');
    final description = useState(isEdit == true ? editHabitValues['description'] : '');
    final category = useState(isEdit == true ? editHabitValues['category'] : '');
    dbTitle = title.value;
    dbDescription = description.value;
    dbCategory = category.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextfield(
            onChanged: (value) {
              dbTitle = title.value = value;
            },
            hintText: t.newhabit.titleHint,
            initialValue: title.value,
            label: t.newhabit.title),
        const SizedBox(height: 10),
        MyTextfield(
            onChanged: (value) {
              dbDescription = description.value = value;
            },
            hintText: t.newhabit.descriptionHint,
            initialValue: description.value,
            label: t.newhabit.description),
        const SizedBox(height: 10),
        MyTextfield(
            onChanged: (value) {
              dbCategory = category.value = value;
            },
            hintText: t.newhabit.categoryHint,
            initialValue: category.value,
            label: t.newhabit.category),
        const SizedBox(height: 10),
      ],
    );
  }
}
