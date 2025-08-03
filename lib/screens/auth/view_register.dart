import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/screens/auth/widgets/register_form.dart';
import 'package:habit_tracker_pre/screens/auth/widgets/or_with.dart';
import 'package:habit_tracker_pre/screens/auth/widgets/top_text.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        backgroundColor: context.myTheme.scaffoldBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: 5),
            child: Column(
              children: const [
                SizedBox(height: 40),
                TopText(type: TopTextType.register),
                SizedBox(height: 40),
                RegisterForm(),
                Spacer(),
                OrWith(type: OrWithType.register)
              ],
            ),
          ),
        ));
  }
}
