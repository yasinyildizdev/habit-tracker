import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_pre/utils/things/languages.dart';
import 'package:habit_tracker_pre/utils/things/user_prefs.dart';
import 'package:habit_tracker_pre/utils/ui/colors.dart';
import 'package:habit_tracker_pre/utils/things/icons.dart';
import 'package:habit_tracker_pre/utils/things/routers.dart';
import 'package:habit_tracker_pre/utils/ui/theme.dart';
import 'package:habit_tracker_pre/widgets/common/snackbar.dart';
import 'package:habit_tracker_pre/widgets/core/high_button.dart';
import 'package:habit_tracker_pre/widgets/core/low_button.dart';
import 'package:habit_tracker_pre/widgets/core/select_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:habit_tracker_pre/utils/data/hive.dart';
import 'package:habit_tracker_pre/gen/strings.g.dart';

class SettingsList extends HookConsumerWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   // final notificationsSwitch = useState(hiveReadData(UserPrefs.notification));
    final adsSwitch = useState(hiveReadData(UserPrefs.ad));
   // final backupSwitch = useState(hiveReadData(UserPrefs.backup));
    final darkModeSwitch = useState(hiveReadData(UserPrefs.darkmode));
    final languageSelect = useState(hiveReadData(UserPrefs.language));

    return Column(
      children: [
        _SettingsItem(
            icon: MyIcons.notification,
            text: t.settings.notification,
            widget: CupertinoSwitch(
              value: false, //notificationsSwitch.value,
              onChanged: (bool value) {
                // notificationsSwitch.value = hiveToggleData(UserPrefs.notification);
              },
            ),
            onTap: () {
              mySnackbar(context, t.common.snackbar.comingSoon);
              //  notificationsSwitch.value = hiveToggleData(UserPrefs.notification);
            }),
        //
        _SettingsItem(
            icon: MyIcons.language,
            text: t.settings.language,
            widget: Text(
              languageSelect.value == Langs.english ? t.settings.english : t.settings.turkish,
              style: context.myTheme.labelMedium,
            ),
            onTap: () {
              languageModal(context, languageSelect);
            }),

        //
        _SettingsItem(
            icon: MyIcons.darkMode,
            text: t.settings.darkMode,
            widget: CupertinoSwitch(
              value: darkModeSwitch.value,
              onChanged: (bool value) {
                darkModeSwitch.value = hiveToggleData(UserPrefs.darkmode);
              },
            ),
            onTap: () {
              darkModeSwitch.value = hiveToggleData(UserPrefs.darkmode);
            }),

        //
        _SettingsItem(
            icon: MyIcons.ad,
            text: t.settings.ads,
            widget: CupertinoSwitch(
              value: adsSwitch.value,
              onChanged: (bool value) {
                if (adsSwitch.value == true) {
                  adModal(context, adsSwitch);
                }
                adsSwitch.value = hiveToggleData(UserPrefs.ad);
              },
            ),
            onTap: () {
              if (adsSwitch.value == true) {
                adModal(context, adsSwitch);
              }
              adsSwitch.value = hiveToggleData(UserPrefs.ad);
            }),

        //
        _SettingsItem(
            icon: MyIcons.backup,
            text: t.settings.backup,
            widget: CupertinoSwitch(
              trackColor: context.myTheme.red,
              value: false, // backupSwitch.value,
              onChanged: (bool value) {
                /*if (backupSwitch.value == true) {
                  backupModal(context, backupSwitch);
                }
                backupSwitch.value = hiveToggleData(UserPrefs.backup); */
              },
            ),
            onTap: () {
              mySnackbar(context, t.common.snackbar.comingSoon);
              /*  if (backupSwitch.value == true) {
                backupModal(context, backupSwitch);
              }
              backupSwitch.value = hiveToggleData(UserPrefs.backup); */
            }),
        //
        _SettingsItem(
            icon: MyIcons.report,
            text: t.settings.report,
            widget: const SizedBox(),
            onTap: () {
              Navigator.pushNamed(context, report);
            }),
        _SettingsItem(
            icon: MyIcons.privacy,
            text: t.settings.privacy,
            widget: const SizedBox(),
            onTap: () {
              Navigator.pushNamed(context, privacy);
            }),
        _SettingsItem(
            icon: MyIcons.info,
            text: t.settings.about,
            widget: const SizedBox(),
            onTap: () {
              Navigator.pushNamed(context, about);
            }),
        _SettingsItem(
            icon: MyIcons.rateUs, text: t.settings.rate, widget: const SizedBox(), onTap: () {}),
      ],
    );
  }

  Future<dynamic> backupModal(BuildContext context, ValueNotifier<dynamic> backupSwitch) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => WillPopScope(
              onWillPop: () async {
                backupSwitch.value = hiveToggleData(UserPrefs.backup);
                return true;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      t.settings.backupAlertText,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: LowButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: t.settings.close,
                            width: double.maxFinite,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: HighButton(
                            onPressed: () {
                              backupSwitch.value = hiveToggleData(UserPrefs.backup);
                              Navigator.pop(context);
                            },
                            color: context.myTheme.blue,
                            text: t.settings.keep,
                            width: double.maxFinite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }

  Future<dynamic> adModal(BuildContext context, ValueNotifier<dynamic> adsSwitch) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => WillPopScope(
              onWillPop: () async {
                adsSwitch.value = hiveToggleData(UserPrefs.ad);
                return true;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      t.settings.adAlertText,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: LowButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: t.settings.close,
                            width: double.maxFinite,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: HighButton(
                            onPressed: () {
                              adsSwitch.value = hiveToggleData(UserPrefs.ad);
                              Navigator.pop(context);
                            },
                            color: context.myTheme.blue,
                            text: t.settings.keep,
                            width: double.maxFinite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }

  Future<dynamic> languageModal(BuildContext context, ValueNotifier<dynamic> languageSelect) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.settings.selectLanguage, style: context.myTheme.titleMedium),
                const SizedBox(height: 10),
                SelectButton(
                  onPressed: () async {
                    languageSelect.value = hiveWriteData(UserPrefs.language, Langs.turkish);
                    Navigator.pop(context);
                  },
                  text: t.settings.turkish,
                  color: context.myTheme.blue,
                  width: double.infinity,
                  isSelect: languageSelect.value == Langs.turkish ? true : false,
                ),
                const SizedBox(height: 10),
                SelectButton(
                  onPressed: () {
                    languageSelect.value = hiveWriteData(UserPrefs.language, Langs.english);
                    Navigator.pop(context);
                  },
                  text: t.settings.english,
                  color: context.myTheme.blue,
                  width: double.infinity,
                  isSelect: languageSelect.value == Langs.english ? true : false,
                )
              ],
            ),
          );
        });
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget widget;
  final VoidCallback onTap;

  const _SettingsItem(
      {required this.icon, required this.text, required this.widget, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 50,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon, color: MyColors.grey),
              const SizedBox(width: 10),
              Text(
                text,
                style: context.myTheme.bodyMedium,
              ),
              const Spacer(),
              Transform.scale(scale: 0.9, child: widget)
            ],
          ),
        ),
      ),
    );
  }
}
