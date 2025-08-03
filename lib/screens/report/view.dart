import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/screens/report/widgets/report_form.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/common/appbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportScreen extends ConsumerWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.myTheme.scaffoldBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.03, vertical: 5),
            child: Column(
              children:  [
                MyAppbar(text: t.report.appbar),
                const SizedBox(height: 20),
                const Expanded(child: ReportForm()),
              ],
            ),
          ),
        ));
  }
}