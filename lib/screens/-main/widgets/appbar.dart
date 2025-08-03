import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/utils/things/icons.dart';
import 'package:habit_tracker_pre/utils/things/routers.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/common/divider.dart';


class MainAppbar extends StatelessWidget {
  const MainAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  "assets/images/logo/habiter.png",
                  width: 25,
                  height: 25,
                ),
              ),
              Text(
                t.common.appName,
                style: context.myTheme.displaySmall
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, settings);
                  },
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Icon(MyIcons.settings,size: 25),
                  )),
            ],
          ),
          const MyDivider(),
        ],
      ),
    );
  }
}
