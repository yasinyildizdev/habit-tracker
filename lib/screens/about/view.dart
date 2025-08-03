import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/screens/about/widgets/company_area.dart';
import 'package:habit_tracker_pre/screens/about/widgets/questions.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/common/appbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.myTheme.scaffoldBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.03, vertical: 5),
            child: Column(
              children:  [
                MyAppbar(text: t.about.appbar),
                const SizedBox(height: 10),
                const CompanyArea(),
                const SizedBox(height: 10),
                const Questions(),
              ],
            ),
          ),
        ));
  }
}