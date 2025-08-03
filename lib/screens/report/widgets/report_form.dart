import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/utils/things/routers.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/core/high_button.dart';
import 'package:habit_tracker_pre/widgets/core/my_textfield.dart';
import 'package:habit_tracker_pre/widgets/common/snackbar.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';

String _title = "";
String _description = "";
String _type = "";
String _email = "";

class ReportForm extends StatelessWidget {
  const ReportForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        children: [
          MyTextfield(
            hintText: t.report.hintTitle,
            onChanged: (value) {},
            label: t.report.labelTitle,
          ),
          const SizedBox(height: 20),
          MyTextfield(
            hintText: t.report.hintDescription,
            onChanged: (value) {},
            label: t.report.labelDescription,
          ),
          const SizedBox(height: 20),
          MyTextfield(
            hintText: t.report.hintType,
            onChanged: (value) {},
            label: t.report.labelType,
          ),
          const SizedBox(height: 20),
          MyTextfield(
            hintText: t.report.hintEmail,
            onChanged: (value) {},
            label: t.report.labelEmail,
          ),
          const SizedBox(height: 30),
          Text(
            t.report.reportNote,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: context.myTheme.text),
          ),
          const SizedBox(height: 10),
          HighButton(
            color: context.myTheme.blue,
            onPressed: () {
              if (_title.isNotEmpty &&
                  _description.isNotEmpty &&
                  _type.isNotEmpty &&
                  _email.isNotEmpty) {
                mySnackbar(context, t.report.snackbar.thanksReport);
                Navigator.pushReplacementNamed(context, mainn);
              } else {
                mySnackbar(context, t.report.snackbar.blankMustFilled);
              }
            },
            text: t.report.report,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
