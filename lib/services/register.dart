import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/utils/data/hive.dart';
import 'package:habit_tracker_pre/utils/things/routers.dart';
import 'package:habit_tracker_pre/utils/things/user_prefs.dart';
import 'package:habit_tracker_pre/widgets/common/snackbar.dart';
import 'package:http/http.dart' as http;

void serviceRegister(context, String username, String password, String confirmPassword) async {
  if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
    mySnackbar(context, t.register.snackbar.blankMustFilled);
  } else {
    if (username.length < 6 || username.length > 15) {
      mySnackbar(context, t.register.snackbar.usernameShouldBe);
    } else if (password != confirmPassword) {
      mySnackbar(context, t.register.snackbar.passwordsDontMatch);
    } else if (password.length < 8 || password.length > 25) {
      mySnackbar(context, t.register.snackbar.passwordShouldBe);
    } else {
      const uriRegister = 'http://www.meshcurrent.site/app/register.php';
      var map = <String, dynamic>{};
      map['username'] = username;
      map['password'] = password;
      map['confirm_password'] = confirmPassword;

      http.Response response = await http.post(
        Uri.parse(uriRegister),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: map,
      );
      String returnValue = response.body.trim();
      if (returnValue == "username-should-be-6-15") {
        mySnackbar(context, t.register.snackbar.usernameShouldBe);
      } else if (returnValue == "passwords-not-match") {
        mySnackbar(context, t.register.snackbar.passwordsDontMatch);
      } else if (returnValue == "password-should-be-8-25") {
        mySnackbar(context, t.register.snackbar.passwordShouldBe);
      } else if (returnValue == "taken-username") {
        mySnackbar(context, t.register.snackbar.takenUsername);
      } else {
        try {
          int newMyId = int.parse(returnValue);
          hiveWriteData(UserPrefs.myId, newMyId);
          Navigator.pushReplacementNamed(context, mainn);
          mySnackbar(context, t.register.snackbar.accountCreated);
        } catch (e) {
          mySnackbar(context, t.register.snackbar.reEnterError);
        }
      }
    }
  }
}
