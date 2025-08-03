import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/screens/info/widgets/heatmap.dart';
import 'package:habit_tracker_pre/screens/info/widgets/infos.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/common/appbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';

class InfoScreen extends ConsumerWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: context.myTheme.scaffoldBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
                vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyAppbar(text: t.info.appbar),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Column(
                      children: const [
                        HeatMap(),
                        SizedBox(height: 20),
                        Infos(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}