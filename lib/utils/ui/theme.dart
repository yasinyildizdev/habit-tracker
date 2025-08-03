import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit_tracker_pre/utils/things/fonts.dart';
import 'package:habit_tracker_pre/utils/ui/colors.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme.tailor.dart';

@Tailor(
  themes: ['light', 'dark'],
  themeGetter: ThemeGetter.onBuildContext,
  generateStaticGetters: true,
)
class $_MyTheme {
//only colors
  static const List<Color> scaffoldBackground = [
    LightColors.white,
    DarkColors.black
  ];
  static const List<Color> blue = [LightColors.blue, DarkColors.blue];
  static const List<Color> red = [LightColors.red, DarkColors.red];
  static const List<Color> green = [LightColors.green, DarkColors.green];
  static const List<Color> divider = [LightColors.grey, DarkColors.grey];
  static const List<Color> modal = [LightColors.grey, DarkColors.grey];
  static const List<Color> stroke = [LightColors.grey, DarkColors.grey];
  static const List<Color> icon = [LightColors.grey, DarkColors.grey];

  static List<Color> iconBackground = [
    LightColors.grey.shade300,
    DarkColors.grey.shade400
  ];
  static List<Color> lowButtonBackground = [
    LightColors.grey.shade200,
    DarkColors.grey.shade200
  ];
  static List<Color> surfaceGrey = [
    LightColors.grey.shade100,
    DarkColors.grey.shade300
  ];
  static List<Color> shadeText = [
    LightColors.grey.shade400,
    DarkColors.grey.shade100
  ];

  static List<Color> text = [LightColors.black, DarkColors.white];

  static const List<Color> surfaceBlue = [
    LightColors.shadeBlue,
    DarkColors.shadeBlue
  ];

//textstyles with colors
  static const displayLarges =
      TextStyle(fontSize: 28, fontWeight: FontWeight.w600);
  static const displayMediums =
      TextStyle(fontSize: 26, fontWeight: FontWeight.w500);
  static const displaySmalls =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600);

  static const titleLarges =
      TextStyle(fontSize: 23, fontWeight: FontWeight.w600);
  static const titleMediums =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  static const titleSmalls =
      TextStyle(fontSize: 17, fontWeight: FontWeight.w600);

  static const bodyLarges =
      TextStyle(fontSize: 22, fontWeight: FontWeight.w500);
  static const bodyMediums =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  

  static const labelLarges =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static const labelMediums =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static const labelSmalls =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

//display
  static List<TextStyle> displayLarge = [
    displayLarges.copyWith(color: MyColors.black),
    displayLarges.copyWith(color: MyColors.grey),
  ];

  static List<TextStyle> displayMedium = [
    displayMediums.copyWith(color: MyColors.black),
    displayMediums.copyWith(color: MyColors.grey),
  ];

  static List<TextStyle> displaySmall = [
    displaySmalls.copyWith(color: MyColors.black),
    displaySmalls.copyWith(color: MyColors.grey),
  ];

//title
  static List<TextStyle> titleLarge = [
    titleLarges.copyWith(color: MyColors.black),
    titleLarges.copyWith(color: MyColors.grey),
  ];

  static List<TextStyle> titleMedium = [
    titleMediums.copyWith(color: MyColors.black),
    titleMediums.copyWith(color: MyColors.grey),
  ];

  static List<TextStyle> titleSmall = [
    titleSmalls.copyWith(color: MyColors.black),
    titleSmalls.copyWith(color: MyColors.grey),
  ];

//body
  static List<TextStyle> bodyLarge = [
    bodyLarges.copyWith(color: MyColors.black),
    bodyLarges.copyWith(color: MyColors.grey),
  ];

  static List<TextStyle> bodyMedium = [
    bodyMediums.copyWith(color: MyColors.black),
    bodyMediums.copyWith(color: MyColors.grey),
  ];

  

//label
  static List<TextStyle> labelLarge = [
    labelLarges.copyWith(color: MyColors.black),
    labelLarges.copyWith(color: MyColors.grey),
  ];

  static List<TextStyle> labelMedium = [
    labelMediums.copyWith(color: MyColors.black),
    labelMediums.copyWith(color: MyColors.grey),
  ];

  static List<TextStyle> labelSmall = [
    labelSmalls.copyWith(color: MyColors.black),
    labelSmalls.copyWith(color: MyColors.grey),
  ];
}

final darkThemeData = ThemeData(
  bottomSheetTheme: const BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: MyColors.darkBlack,
  ),
  checkboxTheme: const CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
  brightness: Brightness.dark,
  fontFamily: MyFonts.gilroy,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  }),
  extensions: [MyTheme.dark],
);

final lightThemeData = ThemeData(
  bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: LightColors.white),
  checkboxTheme: const CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
  brightness: Brightness.light,
  fontFamily: MyFonts.gilroy,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  }),
  extensions: [MyTheme.light],
);
