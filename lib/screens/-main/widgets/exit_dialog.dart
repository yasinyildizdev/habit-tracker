import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/core/high_button.dart';
import 'package:habit_tracker_pre/widgets/core/low_button.dart';

Future<void> exitAppDialog(context) async {
  showDialog(
      context: (context),
      builder: (context) => AlertDialog(
            elevation: 1,
            title: Text(t.common.doExitApp, style: context.myTheme.labelMedium),
            content: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LowButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: t.common.cancel,
                        width: 100),
                    const SizedBox(
                      width: 10,
                    ),
                    HighButton(
                        onPressed: () {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        },
                        text: t.common.exit,
                        color: context.myTheme.blue,
                        width: 100)
                  ],
                )),
          ));
}
