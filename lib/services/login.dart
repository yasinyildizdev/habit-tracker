import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/utils/data/hive.dart';
import 'package:habit_tracker_pre/utils/things/routers.dart';
import 'package:habit_tracker_pre/utils/things/user_prefs.dart';
import 'package:habit_tracker_pre/widgets/common/snackbar.dart';
import 'package:http/http.dart' as http;

void serviceLogin(context, String username, String password) async {
  if (username.isEmpty || password.isEmpty) {
    mySnackbar(context, t.login.snackbar.blankMustFilled);
  } else {
    print("serverstartttt");
    const uriLogin = 'http://www.meshcurrent.site/app/login.php';
    var map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    http.Response response = await http.post(
      Uri.parse(uriLogin),
      body: map,
    );

    String returnValue = response.body.trim();

    if (returnValue == "account-not-found") {
      mySnackbar(context, t.login.snackbar.accountNotFound);
    } else if (returnValue == "invalid-password") {
      mySnackbar(context, t.login.snackbar.invalidPassword);
    } else {
      try {
        hiveWriteData(UserPrefs.myId, returnValue);
        Navigator.pushReplacementNamed(context, mainn);
        mySnackbar(context, t.login.snackbar.loggedIn);
      } catch (e) {
        mySnackbar(context, t.login.snackbar.reEnterError);
      }
    }
  }
}
