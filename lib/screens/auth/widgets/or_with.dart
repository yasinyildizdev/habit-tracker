import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/utils/things/routers.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/common/snackbar.dart';

class OrWith extends StatelessWidget {
  const OrWith({Key? key, required this.type}) : super(key: key);
  final OrWithType type;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        type == OrWithType.login ? t.login.orLogin : t.register.orSignUp,
        style: context.myTheme.labelMedium,
      ),
      const SizedBox(height: 10),
      Row(
        children: const [
          Expanded(child: _GoogleButton()),
          SizedBox(width: 20),
          Expanded(child: _FacebookButton()),
        ],
      ),
      const SizedBox(height: 10),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          type == OrWithType.login ? t.login.dontHaveAccount : t.register.alreadyHaveAccount,
          style: context.myTheme.labelMedium,
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            if (type == OrWithType.login) {
              Navigator.pushReplacementNamed(context, register);
            } else {
              Navigator.pushReplacementNamed(context, login);
            }
          },
          child: Text(
            type == OrWithType.login ? t.login.signUp : t.register.login,
            style: context.myTheme.labelMedium.copyWith(color: context.myTheme.blue),
          ),
        ),
      ])
    ]);
  }
}

enum OrWithType {
  login,
  register,
}

class _GoogleButton extends StatelessWidget {
  const _GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 45,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: context.myTheme.surfaceBlue,
        highlightElevation: 0,
        elevation: 0,
        onPressed: () {
          //google auth
          mySnackbar(context, t.common.snackbar.comingSoon);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: SvgPicture.asset(
            "assets/images/logo/google.svg",
            width: 50,
            height: 50,
          ),
        ));
  }
}

class _FacebookButton extends StatelessWidget {
  const _FacebookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 45,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: context.myTheme.surfaceBlue,
        highlightElevation: 0,
        elevation: 0,
        onPressed: () {
          //facebook auth
          mySnackbar(context, t.common.snackbar.comingSoon);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: SvgPicture.asset(
            "assets/images/logo/facebook.svg",
            width: 50,
            height: 50,
          ),
        ));
  }
}
