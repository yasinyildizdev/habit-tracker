import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/utils/things/icons.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/common/divider.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyDivider(),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),),
            onTap: () {
              //print ("log out");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(MyIcons.logOut,
                  color: context.myTheme.red,),
                  const SizedBox(width: 10),
                  Text(
                    t.settings.logout,
                    style: context.myTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Text("${t.settings.version} 1.0.0",
                      style: context.myTheme.labelLarge),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
