import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/services/login.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/common/snackbar.dart';
import 'package:habit_tracker_pre/widgets/core/high_button.dart';
import 'package:habit_tracker_pre/widgets/core/my_textfield.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = "";
    String password = "";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MyTextfield(
            onChanged: (value) {
              username = value;
            },
            hintText: t.login.username),
        const SizedBox(height: 10),
        MyTextfield(
          onChanged: (value) {
            password = value;
          },
          hintText: t.login.password,
          type: Type.password,
        ),
        const SizedBox(height: 10),
        Text(t.login.forgorPassword),
        const SizedBox(height: 20),
        HighButton(
            onPressed: () {
              if (username.isNotEmpty && password.isNotEmpty) {
                serviceLogin(context, username, password);
              } else {
                mySnackbar(context, t.login.snackbar.blankMustFilled);
              }
            },
            text: t.login.login,
            color: context.myTheme.blue,
            width: double.infinity)
      ],
    );
  }
}
