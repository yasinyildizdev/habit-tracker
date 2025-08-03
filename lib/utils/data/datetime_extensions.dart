// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

extension MyDateTimeExtensions on DateTime {
  //veritabanında 20230509 şeklinde yazmak için kullanılabilir.
  int get toDbDate {
    final year = this.year.toString();
    final month = this.month.toString().padLeft(2, '0');
    final day = this.day.toString().padLeft(2, '0');

    return int.parse("$year$month$day");
  }

  //
  String get toMonthDayYear {
    final month = DateFormat.MMM();
    final day = this.day.toString();
    final year = this.year.toString();
    return "${month.format(this)} $day, $year";
  }

  String get toDbTime {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return "$hour$minute";
  }

  String get toHourMinute {
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    return "$hour : $minute";
  }
}

extension MyDateTimeExtensionsDbToString on int {
  String get dbToMonthDayYear {
    final month = DateFormat("MMM").format(DateTime.parse(toString()));
    final day = DateFormat("dd").format(DateTime.parse(toString()));
    final year = DateFormat("yyyy").format(DateTime.parse(toString()));
    return "$month $day, $year";
  }
}

extension MyDateTimeExtensionsDbToString2 on String {
  DateTime get monthDayYeartoDateTime {
    x[DateFormat("MMM").format(DateTime.parse("20230101"))] = "01";
    x[DateFormat("MMM").format(DateTime.parse("20230201"))] = "02";
    x[DateFormat("MMM").format(DateTime.parse("20230301"))] = "03";
    x[DateFormat("MMM").format(DateTime.parse("20230401"))] = "04";
    x[DateFormat("MMM").format(DateTime.parse("20230501"))] = "05";
    x[DateFormat("MMM").format(DateTime.parse("20230601"))] = "06";
    x[DateFormat("MMM").format(DateTime.parse("20230701"))] = "07";
    x[DateFormat("MMM").format(DateTime.parse("20230801"))] = "08";
    x[DateFormat("MMM").format(DateTime.parse("20230901"))] = "09";
    x[DateFormat("MMM").format(DateTime.parse("20231001"))] = "10";
    x[DateFormat("MMM").format(DateTime.parse("20231101"))] = "11";
    x[DateFormat("MMM").format(DateTime.parse("20231201"))] = "12";

    String month = x[substring(0, 3)].toString();
    String day = substring(4, 6);
    String year = substring(8, 12);

    String formatString = "$year$month$day";
    DateTime dateTimeResult = DateTime.parse(formatString);
    return dateTimeResult;
  }

  String get dbtoHourMinute {
    final time = "${toString().substring(0, 2)}:${toString().substring(2, 4)}";
    return time;
  }
}

Map<String, String> x = {};
