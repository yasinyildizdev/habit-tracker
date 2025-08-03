import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/screens/intro/widgets/pageview.dart';
import 'package:habit_tracker_pre/screens/intro/widgets/appbar.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';

class IntroScreen extends HookWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.myTheme.scaffoldBackground,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0, top: 20),
            child: Column(
              children: const [
               IntroAppbar(),
               Expanded(child: PageviewW()),
              ],
            ),
          ),
        ));
  }
}