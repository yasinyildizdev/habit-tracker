import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';


class CompanyArea extends StatelessWidget {
  const CompanyArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.myTheme.surfaceGrey,
                  border: Border.all(width: 1, color: context.myTheme.stroke)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Column(children: [
                  Image.asset("assets/images/logo/typetek.png",width: 40, height: 40,),
                  const SizedBox(height: 10),
                  Text(t.common.companyName,style: context.myTheme.titleMedium.copyWith(fontSize: 16),),
                ],),
                Column(children: [
                  Image.asset("assets/images/logo/habiter.png",width: 40, height: 40,),
                  const SizedBox(height: 10),
                  Text(t.common.appName,style: context.myTheme.titleSmall),
                ],),
               
              ],
            ),
            const SizedBox(height: 20),
            Text(t.about.companyText,style: context.myTheme.titleSmall,textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}