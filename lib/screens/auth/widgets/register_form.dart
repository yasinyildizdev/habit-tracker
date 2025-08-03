import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/services/register.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/common/snackbar.dart';
import 'package:habit_tracker_pre/widgets/core/high_button.dart';
import 'package:habit_tracker_pre/widgets/core/my_textfield.dart';



class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = "";
    String password = "";
    String confirmPassword = "";
    return Column(
      children: [
        MyTextfield(
            onChanged: (value) {
              username = value;
            },
            hintText: t.register.username),
        const SizedBox(height: 10),
        MyTextfield(
          onChanged: (value) {
            password = value;
          },
          hintText: t.register.password,
          type: Type.password,
        ),
        const SizedBox(height: 10),
        MyTextfield(
          onChanged: (value) {
            confirmPassword = value;
          },
          hintText: t.register.confirmPassword,
          type: Type.password,
        ),
        const SizedBox(height: 20),
        HighButton(
            onPressed: () {
              serviceRegister(context, username, password, confirmPassword);
            },
            text: t.register.signUp,
            color: context.myTheme.blue,
            width: double.infinity)
      ],
    );
  }
}
