import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/screens/-main/widgets/appbar.dart';
import 'package:habit_tracker_pre/screens/-main/widgets/exit_dialog.dart';
import 'package:habit_tracker_pre/screens/home/view.dart';
import 'package:habit_tracker_pre/screens/info/widgets/infos.dart';
import 'package:habit_tracker_pre/screens/new_habit/view.dart';
import 'package:habit_tracker_pre/screens/stats/view.dart';
import 'package:habit_tracker_pre/utils/ui/context_extensions.dart';
import 'package:habit_tracker_pre/utils/things/icons.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';

class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [Home(), NewHabit(), Stats()];
    final currentPage = useState(0);
    return WillPopScope(
      onWillPop: () async {
        exitAppDialog(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: context.myTheme.scaffoldBackground,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.02)),
              child: Column(
                children: [
                  const MainAppbar(),
                  Expanded(child: pages[currentPage.value]),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Stack(
          children: [
            NavigationBar(
              backgroundColor: context.myTheme.surfaceBlue,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              elevation: 20,
              height: 50,
              animationDuration: const Duration(seconds: 1),
              selectedIndex: currentPage.value,
              onDestinationSelected: (int newPage) {
                if (newPage == 1) {
                  isEdit = false;
                  showNewHabitModal(context);
                } else {
                  currentPage.value = newPage;
                }
              },
              destinations: [
                NavigationDestination(
                    selectedIcon: const Icon(MyIcons.home),
                    icon: const Icon(MyIcons.home),
                    label: t.common.home),
                NavigationDestination(
                    selectedIcon: const Icon(MyIcons.plus),
                    icon: const Icon(MyIcons.plus),
                    label: t.common.neww),
                NavigationDestination(
                    selectedIcon: const Icon(MyIcons.stats),
                    icon: const Icon(MyIcons.stats),
                    label: t.common.stats)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> showNewHabitModal(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (context) {
      return SizedBox(height: context.dynamicHeight(0.85), child: const NewHabit());
    },
  );
}
