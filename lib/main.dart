import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';
import 'package:habit_tracker_pre/screens/-main/view.dart';
import 'package:habit_tracker_pre/screens/home/day_habits_hive_model.dart';
import 'package:habit_tracker_pre/screens/intro/view.dart';
import 'package:habit_tracker_pre/screens/stats/habits_hive_model.dart';
import 'package:habit_tracker_pre/utils/data/hive.dart';
import 'package:habit_tracker_pre/utils/things/languages.dart';
import 'package:habit_tracker_pre/utils/things/routers.dart';
import 'package:habit_tracker_pre/utils/things/user_prefs.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:device_preview/device_preview.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, statusBarColor: Colors.transparent));

  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  await Hive.initFlutter();
  await Hive.openBox('userPrefs');

  Hive.registerAdapter(HabitsHiveAdapter());
  Hive.openBox<HabitsHive>('habits');

  Hive.registerAdapter(DayHabitsAdapter());
  Hive.openBox<DayHabitsHive>('dayHabits');

  runApp(
    ProviderScope(
      child: DevicePreview(enabled: false, builder: (context) => const MyApp()),
    ),
  );
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dynamic myId = hiveReadData(UserPrefs.myId);
    if (myId == null) {
      hiveWriteData(UserPrefs.notification, true);
      hiveWriteData(UserPrefs.ad, true);
      hiveWriteData(UserPrefs.darkmode, false);
      hiveWriteData(UserPrefs.backup, false);
      hiveWriteData(UserPrefs.language, Langs.english);
    }
    return ValueListenableBuilder(
        valueListenable: Hive.box('userPrefs').listenable(),
        builder: (context, box, widget) {
          Intl.defaultLocale = hiveReadData(UserPrefs.language);
          hiveReadData(UserPrefs.language) == Langs.english
              ? LocaleSettings.setLocale(AppLocale.en)
              : LocaleSettings.setLocale(AppLocale.tr);
          return MaterialApp(
              useInheritedMediaQuery: true,
              onGenerateRoute: MyRoutes.generateRoute,
              locale: hiveReadData(UserPrefs.language) == Langs.english
                  ? AppLocale.en.flutterLocale
                  : AppLocale.tr.flutterLocale,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              theme: hiveReadData(UserPrefs.darkmode) == true ? darkThemeData : lightThemeData,
              debugShowCheckedModeBanner: false,
              home: const MyHomePage());
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    dynamic myId = hiveReadData(UserPrefs.myId);
    return myId == null ? const IntroScreen() : const MainScreen();
  }
}
