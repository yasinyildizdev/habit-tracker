import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/screens/info/widgets/infos.dart';
import 'package:habit_tracker_pre/utils/ui/context_extensions.dart';
import 'package:habit_tracker_pre/utils/things/image.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';

String dbIcon = '';

class IconSelect extends HookWidget {
  const IconSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIcon = useState(isEdit == true ? editHabitValues['icon'] : '');
      dbIcon = selectedIcon.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.newhabit.icon,
          style: context.myTheme.labelMedium,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: context.dynamicWidth(1 / 7),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: Habits.icons.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: _IconItem(
                  icon: Habits.icons[index],
                  isSelect: selectedIcon.value == Habits.iconNames[index]
                      ? true
                      : false,
                  onPressed: () {
                    dbIcon = selectedIcon.value = Habits.iconNames[index];
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _IconItem extends StatelessWidget {
  const _IconItem(
      {Key? key,
      required this.icon,
      required this.isSelect,
      required this.onPressed})
      : super(key: key);
  final String icon;
  final bool isSelect;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPressed,
      child: Ink(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: isSelect == true
                    ? context.myTheme.blue
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(10),
            color: context.myTheme.iconBackground),
        child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(icon, width: context.dynamicWidth(1 / 7))),
      ),
    );
  }
}
