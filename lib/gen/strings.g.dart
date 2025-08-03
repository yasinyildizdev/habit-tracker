/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 358 (179 per locale)
///
/// Built on 2023-06-10 at 13:40 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	tr(languageCode: 'tr', build: _StringsTr.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
	late final _StringsIntroEn intro = _StringsIntroEn._(_root);
	late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
	late final _StringsAboutEn about = _StringsAboutEn._(_root);
	late final _StringsReportEn report = _StringsReportEn._(_root);
	late final _StringsPrivacyEn privacy = _StringsPrivacyEn._(_root);
	late final _StringsRegisterEn register = _StringsRegisterEn._(_root);
	late final _StringsLoginEn login = _StringsLoginEn._(_root);
	late final _StringsNewhabitEn newhabit = _StringsNewhabitEn._(_root);
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsStatsEn stats = _StringsStatsEn._(_root);
	late final _StringsInfoEn info = _StringsInfoEn._(_root);
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get companyName => 'TypeTek';
	String get appName => 'Habiter';
	String get exit => 'EXIT';
	String get cancel => 'CANCEL';
	String get doExitApp => 'Do you want to exit app?';
	String get home => 'Home';
	String get neww => 'New';
	String get stats => 'Stats';
	late final _StringsCommonSnackbarEn snackbar = _StringsCommonSnackbarEn._(_root);
}

// Path: intro
class _StringsIntroEn {
	_StringsIntroEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get appbar => 'Habiter by TypeTek';
	String get title0 => 'Set Your Goals';
	String get text0 => 'In our app, you can maintain a more disciplined lifestyle by setting daily goals';
	String get title1 => 'Get Personal Reports';
	String get text1 => 'Habiter helps you achive your daily, weekly and monthly goals by tracking your habits';
	String get title2 => 'Track Your Habits';
	String get text2 => 'The app provides you with personal reports that offer detailed analysis of your daily activities';
	String get skip => 'SKIP';
	String get next => 'NEXT';
}

// Path: settings
class _StringsSettingsEn {
	_StringsSettingsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get appbar => 'Settings';
	String get notification => 'Notification';
	String get language => 'Language';
	String get darkMode => 'Dark Mode';
	String get ads => 'Ads';
	String get backup => 'Backup';
	String get report => 'Report a problem';
	String get privacy => 'Privacy policy';
	String get about => 'About us';
	String get rate => 'Rate us';
	String get logout => 'Logout';
	String get version => 'Version';
	String get english => 'English';
	String get turkish => 'Turkish';
	String get keep => 'KEEP ENABLE';
	String get close => 'CLOSE ANYWAY';
	String get selectLanguage => 'Select Language';
	String get adAlertText => 'The ability to turn off ads is offered to all users free of charge. However, it is recommended that you leave it open to the developer for support purposes.';
	String get backupAlertText => 'When you turn off backup, all data of your account is stored on your device. Inaccessible from other devices';
}

// Path: about
class _StringsAboutEn {
	_StringsAboutEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get appbar => 'About us';
	String get companyText => 'Habiter is a TypeTek product. It is free and available for personal use';
	String get question0 => 'What is TypeTek?';
	String get answer0 => 'TypeTek is an individual initiative that provides digital services in the fields of productivity and personal development';
	String get question1 => 'What is Habiter';
	String get answer1 => 'TypeTek is an individual initiative that provides digital services in the fields of productivity and personal development';
	String get question2 => 'How to use habiter more efficiently?';
	String get answer2 => 'TypeTek is an individual initiative that provides digital services in the fields of productivity and personal development';
}

// Path: report
class _StringsReportEn {
	_StringsReportEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get appbar => 'Report a problem';
	String get labelTitle => 'Title';
	String get hintTitle => 'Write a title for report';
	String get labelDescription => 'Description';
	String get hintDescription => 'Write a description';
	String get labelType => 'Type';
	String get hintType => 'Write a type';
	String get labelEmail => 'E-mail';
	String get hintEmail => 'Write your e-mail';
	String get reportNote => 'Note: Please send a report with correct information. Incorrect notifications prevent the application from being developed positively. Also, thank you for your report notifications';
	String get report => 'REPORT';
	late final _StringsReportSnackbarEn snackbar = _StringsReportSnackbarEn._(_root);
}

// Path: privacy
class _StringsPrivacyEn {
	_StringsPrivacyEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get appbar => 'Privacy policy';
	String get question0 => 'Who created this privacy policy?';
	String get answer0 => 'This privacy policy has been written in its entirety by the developer individually. It is not affiliated with any institution or company';
	String get question1 => 'What is the purpose of the privacy policy?';
	String get answer1 => 'This privacy policy includes disclosures about the collection, use and disclosure of our users\' personal information';
	String get question2 => 'Data collection';
	String get answer2 => 'Information collected from users is only necessary to perform the functions of our application. This information can be collected on the form or account creation page provided by users';
	String get question3 => 'Information Use';
	String get answer3 => 'The information collected is used only for the development and improvement of our application. This information may be used to improve user experience, troubleshoot and improve our services';
	String get question4 => 'Information sharing';
	String get answer4 => 'Users\' personal information will never be shared with third parties';
	String get question5 => 'Information security';
	String get answer5 => 'The security of users\' personal information is important to us. Therefore, various security measures are taken to protect the personal information of users. These measures include access control, data encryption, and secure server storage. All data stored in our database is encrypted. Including the developer cannot see this data';
	String get question6 => 'User Rights';
	String get answer6 => 'Users have the right to control and manage the personal information collected in our application. Users can edit their personal information in the account settings section, and can request deletion of their accounts or deletion of data collected by the application at any time';
	String get question7 => 'Changes';
	String get answer7 => 'We reserve the right to make changes to our privacy policy. Any changes to this policy will be posted on this page and notified to our users';
	String get writtenBy => 'Written by TypeTek';
	String get writtenDate => 'Jan 18, 2023';
}

// Path: register
class _StringsRegisterEn {
	_StringsRegisterEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Create account';
	String get text => 'Let’s get started your journey by creating an account';
	String get username => 'username';
	String get password => 'password';
	String get confirmPassword => 'confirm password';
	String get signUp => 'SING UP';
	String get orSignUp => 'Or sign up with';
	String get alreadyHaveAccount => 'Already have an account?';
	String get login => 'Login';
	late final _StringsRegisterSnackbarEn snackbar = _StringsRegisterSnackbarEn._(_root);
}

// Path: login
class _StringsLoginEn {
	_StringsLoginEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Welcome Back!';
	String get text => 'Sign in to accsess your personalized experience';
	String get username => 'username';
	String get password => 'password';
	String get login => 'LOGIN';
	String get forgorPassword => 'Forgot password?';
	String get orLogin => 'Or login with';
	String get dontHaveAccount => 'Don’t have an account?';
	String get signUp => 'Sign Up';
	late final _StringsLoginSnackbarEn snackbar = _StringsLoginSnackbarEn._(_root);
}

// Path: newhabit
class _StringsNewhabitEn {
	_StringsNewhabitEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get appbar => 'ADD NEW';
	String get icon => 'Icon';
	String get title => 'Title';
	String get titleHint => 'Write a title';
	String get description => 'Description';
	String get descriptionHint => 'Write a description';
	String get category => 'Category';
	String get categoryHint => 'Write category';
	String get start => 'Start';
	String get startHint => 'Start date';
	String get end => 'End';
	String get endHint => 'End date';
	String get time => 'Time';
	String get timeHint => 'Select time';
	String get reminder => 'Reminder';
	String get before5m => 'bfr. 5m';
	String get before30m => 'bfr. 30m';
	String get before1h => 'bfr. 1h';
	String get onTime => 'on time';
	String get disable => 'Disable';
	String get type => 'Type';
	String get toDo => 'To do';
	String get notToDo => 'Not to do';
	String get frequency => 'Frequency';
	String get everyDay => 'Every Day';
	String get monday => 'Monday';
	String get tuesday => 'Tuesday';
	String get wednesday => 'Wednesday';
	String get thursday => 'Thursday';
	String get friday => 'Friday';
	String get saturday => 'Saturday';
	String get sunday => 'Sunday';
	String get create => 'CREATE';
	String get cancel => 'CANCEL';
	String get edit => 'EDIT';
	late final _StringsNewhabitSnackbarEn snackbar = _StringsNewhabitSnackbarEn._(_root);
}

// Path: home
class _StringsHomeEn {
	_StringsHomeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get thisWeek => 'This week';
	String get today => 'Today';
	String get yesterday => 'Yesterday';
	String get ago => 'ago';
	String get days => 'days';
	String get tomorrow => 'Tomorrow';
	String get later => 'later';
	String get success => 'SUCCESS';
	String get failure => 'FAILURE';
	String get enterComplete => 'Enter Complate Comment';
	String get complate => 'Complate';
	String get blankList => 'No habits for the day';
}

// Path: stats
class _StringsStatsEn {
	_StringsStatsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get allHabits => 'All Habits';
	String get blankList => 'No habit yet';
}

// Path: info
class _StringsInfoEn {
	_StringsInfoEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get appbar => 'Habit info';
	String get description => 'Description';
	String get startDate => 'Start date';
	String get endDate => 'End Date';
	String get category => 'Category';
	String get type => 'Type';
	String get toDo => 'To do';
	String get notToDo => 'Not to do';
	String get reminder => 'Reminder';
	String get before5m => 'Bfr5m';
	String get before30m => 'Bfr30m';
	String get before1h => 'bfr1h';
	String get onTime => 'On Time';
	String get disable => 'Disable';
	String get time => 'Time';
	String get Frequency => 'Frequency';
	String get complateComment => 'Complate comment';
	String get delete => 'DELETE';
	String get edit => 'EDIT';
}

// Path: common.snackbar
class _StringsCommonSnackbarEn {
	_StringsCommonSnackbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get comingSoon => 'Coming Soon...';
}

// Path: report.snackbar
class _StringsReportSnackbarEn {
	_StringsReportSnackbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get thanksReport => 'Thanks for the report';
	String get blankMustFilled => 'All blanks must be filled';
}

// Path: register.snackbar
class _StringsRegisterSnackbarEn {
	_StringsRegisterSnackbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get accountCreated => 'Account created';
	String get passwordsDontMatch => 'Passwords do not match';
	String get usernameShouldBe => 'Username must be between 6-15 characters';
	String get passwordShouldBe => 'Password must be between 8-25 characters';
	String get takenUsername => 'Username taken';
	String get blankMustFilled => 'All blanks must be filled';
	String get reEnterError => 'An error occurred please re-enter the app';
}

// Path: login.snackbar
class _StringsLoginSnackbarEn {
	_StringsLoginSnackbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get loggedIn => 'logged in';
	String get invalidPassword => 'Invalid password';
	String get accountNotFound => 'Account not found';
	String get blankMustFilled => 'All blanks must be filled';
	String get reEnterError => 'An error occurred please re-enter the app';
}

// Path: newhabit.snackbar
class _StringsNewhabitSnackbarEn {
	_StringsNewhabitSnackbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get habitCreated => 'Habit created';
	String get blankMustFilled => 'All blanks must be filled';
	String get categoryCannotLong => 'Category cannot exceed 20 characters';
	String get titleCannotLong => 'Title cannot exceed 25 characters';
}

// Path: <root>
class _StringsTr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsTr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsCommonTr common = _StringsCommonTr._(_root);
	@override late final _StringsIntroTr intro = _StringsIntroTr._(_root);
	@override late final _StringsSettingsTr settings = _StringsSettingsTr._(_root);
	@override late final _StringsAboutTr about = _StringsAboutTr._(_root);
	@override late final _StringsReportTr report = _StringsReportTr._(_root);
	@override late final _StringsPrivacyTr privacy = _StringsPrivacyTr._(_root);
	@override late final _StringsRegisterTr register = _StringsRegisterTr._(_root);
	@override late final _StringsLoginTr login = _StringsLoginTr._(_root);
	@override late final _StringsNewhabitTr newhabit = _StringsNewhabitTr._(_root);
	@override late final _StringsHomeTr home = _StringsHomeTr._(_root);
	@override late final _StringsStatsTr stats = _StringsStatsTr._(_root);
	@override late final _StringsInfoTr info = _StringsInfoTr._(_root);
}

// Path: common
class _StringsCommonTr implements _StringsCommonEn {
	_StringsCommonTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get companyName => 'TypeTek';
	@override String get appName => 'Habiter';
	@override String get exit => 'ÇIKIŞ';
	@override String get cancel => 'İPTAL';
	@override String get doExitApp => 'Uygulamadan çıkmak mı istiyorsun?';
	@override String get home => 'Ana sayfa';
	@override String get neww => 'Yeni';
	@override String get stats => 'İstistikler';
	@override late final _StringsCommonSnackbarTr snackbar = _StringsCommonSnackbarTr._(_root);
}

// Path: intro
class _StringsIntroTr implements _StringsIntroEn {
	_StringsIntroTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get appbar => 'TypeTek\'den Habiter';
	@override String get title0 => 'Hedeflerini belirle';
	@override String get text0 => 'Uygulamamızda günlük hedefler belirleyerek daha disiplinli bir yaşam tarzı sürdürebilirsiniz.';
	@override String get title1 => 'Alışkanlıklarınızı Takip Edin';
	@override String get text1 => 'Habiter, alışkanlıklarınızı takip ederek günlük, haftalık ve aylık hedeflerinize ulaşmanıza yardımcı olur.';
	@override String get title2 => 'Kişisel Raporlar Alın';
	@override String get text2 => 'Uygulama, size günlük etkinliklerinizin ayrıntılı analizini sunan kişisel raporlar sunar.';
	@override String get skip => ' GEÇ ';
	@override String get next => 'İLERİ';
}

// Path: settings
class _StringsSettingsTr implements _StringsSettingsEn {
	_StringsSettingsTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get appbar => 'Ayarlar';
	@override String get notification => 'Bildirimler';
	@override String get language => 'Dil';
	@override String get darkMode => 'Koyu tema';
	@override String get ads => 'Reklamlar';
	@override String get backup => 'Yedekleme';
	@override String get report => 'Rapor';
	@override String get privacy => 'Gizlilik politikası';
	@override String get about => 'Hakkında';
	@override String get rate => 'Bize puan verin';
	@override String get logout => 'Çıkış';
	@override String get version => 'Versiyon';
	@override String get english => 'İngilizce';
	@override String get turkish => 'Türkçe';
	@override String get keep => 'AÇIK TUT';
	@override String get close => 'KAPAT';
	@override String get selectLanguage => 'Dil seç';
	@override String get adAlertText => 'Reklamları kapatma özelliği tüm kullanıcılara ücretsiz şekilde sunulur. Ancak geliştiriciye destek amaçlı açık bırakmanız önerilir';
	@override String get backupAlertText => 'Yedeklemeyi kapattığınızda hesabınıza ait tüm veriler cihazınızda saklanır. Diğer cihazlardan erişilemez';
}

// Path: about
class _StringsAboutTr implements _StringsAboutEn {
	_StringsAboutTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get appbar => 'Hakkımızda';
	@override String get companyText => 'Habiter bir TypeTek ürünüdür. Ücretsizdir ve kişisel kullanımlar için sunulur';
	@override String get question0 => 'TypeTek nedir?';
	@override String get answer0 => 'TypeTek verimlilik ve kişisel gelişim alanlarında dijital hizmetler sunan bir bireysel girişimdir.';
	@override String get question1 => 'Habiter nedir?';
	@override String get answer1 => 'TypeTek verimlilik ve kişisel gelişim alanlarında dijital hizmetler sunan bir bireysel girişimdir.';
	@override String get question2 => 'Habiter nasıl daha verimli kullanılır?';
	@override String get answer2 => 'TypeTek verimlilik ve kişisel gelişim alanlarında dijital hizmetler sunan bir bireysel girişimdir.';
}

// Path: report
class _StringsReportTr implements _StringsReportEn {
	_StringsReportTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get appbar => 'Rapor gönder';
	@override String get labelTitle => 'Başlık';
	@override String get hintTitle => 'Rapor için başlık yaz';
	@override String get labelDescription => 'Açıklama';
	@override String get hintDescription => 'Bir açıklama yaz';
	@override String get labelType => 'Tip';
	@override String get hintType => 'Bir tip yaz';
	@override String get labelEmail => 'E-posta';
	@override String get hintEmail => 'E-mail adresini yaz';
	@override String get reportNote => 'Not: Lütfen doğru bilgi içeren bir rapor gönderiniz. Yanlış bildirimler uygulamanın olumlu yönde geliştirilmesine engel olmaktadır. Ayrıca rapor bildirimleriniz için teşekkür ederiz';
	@override String get report => 'RAPOR';
	@override late final _StringsReportSnackbarTr snackbar = _StringsReportSnackbarTr._(_root);
}

// Path: privacy
class _StringsPrivacyTr implements _StringsPrivacyEn {
	_StringsPrivacyTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get appbar => 'Gizlilik politikası';
	@override String get question0 => 'Bu gizlilik politikası kim tarafından hazırlanmıştır?';
	@override String get answer0 => 'Bu gizlilik politikası bütünü ile geliştirici tarafından bireysel olarak yazılmıştır. Herhangi bir kurum veya şirket ile bağlantısı yoktur.';
	@override String get question1 => 'Gizlilik politikasının amacı nedir?';
	@override String get answer1 => 'Bu gizlilik politikası, kullanıcılarımızın kişisel bilgilerinin toplanması, kullanımı ve ifşa edilmesiyle ilgili açıklamaları içermektedir.';
	@override String get question2 => 'Bilgi Toplama';
	@override String get answer2 => 'Kullanıcılardan toplanan bilgiler, sadece uygulamamızın işlevlerini yerine getirmek için gereklidir. Bu bilgiler, kullanıcılar tarafından sağlanan form veya hesap oluşturma sayfasında toplanabilir.';
	@override String get question3 => 'Bilgi Kullanımı';
	@override String get answer3 => 'Toplanan bilgiler sadece uygulamamızın geliştirilmesi ve iyileştirilmesi için kullanılır. Bu bilgiler, kullanıcı deneyiminin geliştirilmesi, sorun giderme ve hizmetlerimizin iyileştirilmesi için kullanılabilir.';
	@override String get question4 => 'Bilgi Paylaşımı';
	@override String get answer4 => 'Kullanıcıların kişisel bilgileri asla üçüncü taraflarla paylaşılmayacaktır.';
	@override String get question5 => 'Bilgi Güvenliği';
	@override String get answer5 => 'Kullanıcıların kişisel bilgilerinin güvenliği bizim için önemlidir. Bu nedenle, kullanıcıların kişisel bilgilerini korumak için çeşitli güvenlik önlemleri alınmaktadır. Bu önlemler, erişim kontrolü, veri şifreleme ve güvenli sunucu depolamasını içerir. Veritabanımızda depolanan tüm veriler şifrelidir. Geliştirici dahil bu verileri göremez.';
	@override String get question6 => 'Kullanıcı Hakları';
	@override String get answer6 => 'Kullanıcılar, uygulamamızda toplanan kişisel bilgileri kontrol etme ve yönetme hakkına sahiptir. Kullanıcılar, hesap ayarları bölümünden kişisel bilgilerini düzenleyebilir, istedikleri zaman hesaplarını silme veya uygulama tarafından toplanan verilerin silinmesi talebinde bulunabilirler.';
	@override String get question7 => 'Değişiklikler';
	@override String get answer7 => 'Gizlilik politikamızda değişiklik yapma hakkımız saklıdır. Bu politikada yapılacak herhangi bir değişiklik, bu sayfada yayınlanacak ve kullanıcılarımıza bildirilecektir.';
	@override String get writtenBy => 'TypeTek tarafından yazılmıştır.';
	@override String get writtenDate => 'Ocak 18, 2023';
}

// Path: register
class _StringsRegisterTr implements _StringsRegisterEn {
	_StringsRegisterTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hesap oluştur';
	@override String get text => 'Bir hesap oluşturarak yolculuğunuza başlayalım';
	@override String get username => 'kullanıcı adı';
	@override String get password => 'şifre';
	@override String get confirmPassword => 'şifreyi onayla';
	@override String get signUp => 'KAYIT OL';
	@override String get orSignUp => 'veya ile kayıt ol';
	@override String get alreadyHaveAccount => 'Zaten hesabınız var mı?';
	@override String get login => 'Giriş yap';
	@override late final _StringsRegisterSnackbarTr snackbar = _StringsRegisterSnackbarTr._(_root);
}

// Path: login
class _StringsLoginTr implements _StringsLoginEn {
	_StringsLoginTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tekrar hoşgeldiniz!';
	@override String get text => 'Kişiselleştirilmiş deneyiminize erişmek için oturum açın';
	@override String get username => 'kullanıcı adı';
	@override String get password => 'şifre';
	@override String get login => 'GİRİŞ YAP';
	@override String get forgorPassword => 'şifreni mi unuttun';
	@override String get orLogin => 'veya giriş yap';
	@override String get dontHaveAccount => 'Bir hsabın yok mu?';
	@override String get signUp => 'Kayıt ol';
	@override late final _StringsLoginSnackbarTr snackbar = _StringsLoginSnackbarTr._(_root);
}

// Path: newhabit
class _StringsNewhabitTr implements _StringsNewhabitEn {
	_StringsNewhabitTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get appbar => 'YENİ EKLE';
	@override String get icon => 'Simge';
	@override String get title => 'Başlık';
	@override String get titleHint => 'Bir başlık yaz';
	@override String get description => 'Açıklama';
	@override String get descriptionHint => 'Bir açıklama yaz';
	@override String get category => 'Kategori';
	@override String get categoryHint => 'Bir kategori yaz';
	@override String get start => 'Başlangıç';
	@override String get startHint => 'Başangıç tarihi';
	@override String get end => 'Bitiş';
	@override String get endHint => 'Bitiş tarihi';
	@override String get time => 'Saat';
	@override String get timeHint => 'Saat seç';
	@override String get reminder => 'Hatırlatıcı';
	@override String get before5m => '5dk ö';
	@override String get before30m => '30dk ö';
	@override String get before1h => '1s ö';
	@override String get onTime => 'zmnda';
	@override String get disable => 'dvre dşı';
	@override String get type => 'Tip';
	@override String get toDo => 'Yapılacak';
	@override String get notToDo => 'Yapılmayacak';
	@override String get frequency => 'Sıklık';
	@override String get everyDay => 'Her gün';
	@override String get monday => 'Pazartesi';
	@override String get tuesday => 'Salı';
	@override String get wednesday => 'Çarşamba';
	@override String get thursday => 'Perşembe';
	@override String get friday => 'Cuma';
	@override String get saturday => 'Cumartesi';
	@override String get sunday => 'Pazar';
	@override String get create => 'OLUŞTUR';
	@override String get cancel => 'İPTAL';
	@override String get edit => 'DÜZENLE';
	@override late final _StringsNewhabitSnackbarTr snackbar = _StringsNewhabitSnackbarTr._(_root);
}

// Path: home
class _StringsHomeTr implements _StringsHomeEn {
	_StringsHomeTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get thisWeek => 'Bu hafta';
	@override String get today => 'Bugün';
	@override String get yesterday => 'Dün';
	@override String get ago => 'önce';
	@override String get days => 'gün';
	@override String get tomorrow => 'Yarın';
	@override String get later => 'sonra';
	@override String get success => 'BAŞARI';
	@override String get failure => 'BAŞARISIZLIK';
	@override String get enterComplete => 'Tamamlanma yorumu gir';
	@override String get complate => 'Tamamla';
	@override String get blankList => 'İlgili gün için bir habit yok';
}

// Path: stats
class _StringsStatsTr implements _StringsStatsEn {
	_StringsStatsTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get allHabits => 'Tüm alışkanlıklar';
	@override String get blankList => 'Henüz hiç alışkanlık yok';
}

// Path: info
class _StringsInfoTr implements _StringsInfoEn {
	_StringsInfoTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get appbar => 'Habit bilgi';
	@override String get description => 'Açıklama';
	@override String get startDate => 'Başlangıç';
	@override String get endDate => 'Bitiş';
	@override String get category => 'Kategori';
	@override String get type => 'Tip';
	@override String get toDo => 'Yapılacak';
	@override String get notToDo => 'Yapılmayacak';
	@override String get reminder => 'Hatırlatıcı';
	@override String get before5m => '5 dk ö';
	@override String get before30m => '30dk ö';
	@override String get before1h => '1s ö';
	@override String get onTime => 'Zamanında';
	@override String get disable => 'Kapalı';
	@override String get time => 'Saat';
	@override String get Frequency => 'Sıklık';
	@override String get complateComment => 'Tamamlama yorumu';
	@override String get delete => 'SİL';
	@override String get edit => 'DÜZENLE';
}

// Path: common.snackbar
class _StringsCommonSnackbarTr implements _StringsCommonSnackbarEn {
	_StringsCommonSnackbarTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => 'Çok yakında...';
}

// Path: report.snackbar
class _StringsReportSnackbarTr implements _StringsReportSnackbarEn {
	_StringsReportSnackbarTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get thanksReport => 'Rapor için teşekkürler';
	@override String get blankMustFilled => 'Tüm boşluklar doldurulmalıdır';
}

// Path: register.snackbar
class _StringsRegisterSnackbarTr implements _StringsRegisterSnackbarEn {
	_StringsRegisterSnackbarTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get accountCreated => 'Hesap oluşturuldu';
	@override String get passwordsDontMatch => 'Şifreler uyuşmuyor';
	@override String get usernameShouldBe => 'Kullanıcı adı 6-15 karakter arasında olmalıdır';
	@override String get passwordShouldBe => 'Şifre adı 8-25 karakter arasında olmalıdır';
	@override String get takenUsername => 'Kullanıcı adı alınmış';
	@override String get blankMustFilled => 'Tüm boşluklar doldurulmalıdır';
	@override String get reEnterError => 'Bir hata oluştu lütfen uygulamaya tekrar girin';
}

// Path: login.snackbar
class _StringsLoginSnackbarTr implements _StringsLoginSnackbarEn {
	_StringsLoginSnackbarTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'Giriş yapıldı';
	@override String get invalidPassword => 'Geçersiz şifre';
	@override String get accountNotFound => 'Hesap bulunamadı';
	@override String get blankMustFilled => 'Tüm boşluklar doldurulmalıdır';
	@override String get reEnterError => 'Bir hata oluştu lütfen uygulamaya tekrar girin';
}

// Path: newhabit.snackbar
class _StringsNewhabitSnackbarTr implements _StringsNewhabitSnackbarEn {
	_StringsNewhabitSnackbarTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get habitCreated => 'Habit oluşturuldu';
	@override String get blankMustFilled => 'Tüm boşluklar doldurulmalıdır';
	@override String get categoryCannotLong => 'Kategori 20 karakterden fazla olamaz';
	@override String get titleCannotLong => 'Başlık 25 karakterden fazla olamaz';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.companyName': return 'TypeTek';
			case 'common.appName': return 'Habiter';
			case 'common.exit': return 'EXIT';
			case 'common.cancel': return 'CANCEL';
			case 'common.doExitApp': return 'Do you want to exit app?';
			case 'common.home': return 'Home';
			case 'common.neww': return 'New';
			case 'common.stats': return 'Stats';
			case 'common.snackbar.comingSoon': return 'Coming Soon...';
			case 'intro.appbar': return 'Habiter by TypeTek';
			case 'intro.title0': return 'Set Your Goals';
			case 'intro.text0': return 'In our app, you can maintain a more disciplined lifestyle by setting daily goals';
			case 'intro.title1': return 'Get Personal Reports';
			case 'intro.text1': return 'Habiter helps you achive your daily, weekly and monthly goals by tracking your habits';
			case 'intro.title2': return 'Track Your Habits';
			case 'intro.text2': return 'The app provides you with personal reports that offer detailed analysis of your daily activities';
			case 'intro.skip': return 'SKIP';
			case 'intro.next': return 'NEXT';
			case 'settings.appbar': return 'Settings';
			case 'settings.notification': return 'Notification';
			case 'settings.language': return 'Language';
			case 'settings.darkMode': return 'Dark Mode';
			case 'settings.ads': return 'Ads';
			case 'settings.backup': return 'Backup';
			case 'settings.report': return 'Report a problem';
			case 'settings.privacy': return 'Privacy policy';
			case 'settings.about': return 'About us';
			case 'settings.rate': return 'Rate us';
			case 'settings.logout': return 'Logout';
			case 'settings.version': return 'Version';
			case 'settings.english': return 'English';
			case 'settings.turkish': return 'Turkish';
			case 'settings.keep': return 'KEEP ENABLE';
			case 'settings.close': return 'CLOSE ANYWAY';
			case 'settings.selectLanguage': return 'Select Language';
			case 'settings.adAlertText': return 'The ability to turn off ads is offered to all users free of charge. However, it is recommended that you leave it open to the developer for support purposes.';
			case 'settings.backupAlertText': return 'When you turn off backup, all data of your account is stored on your device. Inaccessible from other devices';
			case 'about.appbar': return 'About us';
			case 'about.companyText': return 'Habiter is a TypeTek product. It is free and available for personal use';
			case 'about.question0': return 'What is TypeTek?';
			case 'about.answer0': return 'TypeTek is an individual initiative that provides digital services in the fields of productivity and personal development';
			case 'about.question1': return 'What is Habiter';
			case 'about.answer1': return 'TypeTek is an individual initiative that provides digital services in the fields of productivity and personal development';
			case 'about.question2': return 'How to use habiter more efficiently?';
			case 'about.answer2': return 'TypeTek is an individual initiative that provides digital services in the fields of productivity and personal development';
			case 'report.appbar': return 'Report a problem';
			case 'report.labelTitle': return 'Title';
			case 'report.hintTitle': return 'Write a title for report';
			case 'report.labelDescription': return 'Description';
			case 'report.hintDescription': return 'Write a description';
			case 'report.labelType': return 'Type';
			case 'report.hintType': return 'Write a type';
			case 'report.labelEmail': return 'E-mail';
			case 'report.hintEmail': return 'Write your e-mail';
			case 'report.reportNote': return 'Note: Please send a report with correct information. Incorrect notifications prevent the application from being developed positively. Also, thank you for your report notifications';
			case 'report.report': return 'REPORT';
			case 'report.snackbar.thanksReport': return 'Thanks for the report';
			case 'report.snackbar.blankMustFilled': return 'All blanks must be filled';
			case 'privacy.appbar': return 'Privacy policy';
			case 'privacy.question0': return 'Who created this privacy policy?';
			case 'privacy.answer0': return 'This privacy policy has been written in its entirety by the developer individually. It is not affiliated with any institution or company';
			case 'privacy.question1': return 'What is the purpose of the privacy policy?';
			case 'privacy.answer1': return 'This privacy policy includes disclosures about the collection, use and disclosure of our users\' personal information';
			case 'privacy.question2': return 'Data collection';
			case 'privacy.answer2': return 'Information collected from users is only necessary to perform the functions of our application. This information can be collected on the form or account creation page provided by users';
			case 'privacy.question3': return 'Information Use';
			case 'privacy.answer3': return 'The information collected is used only for the development and improvement of our application. This information may be used to improve user experience, troubleshoot and improve our services';
			case 'privacy.question4': return 'Information sharing';
			case 'privacy.answer4': return 'Users\' personal information will never be shared with third parties';
			case 'privacy.question5': return 'Information security';
			case 'privacy.answer5': return 'The security of users\' personal information is important to us. Therefore, various security measures are taken to protect the personal information of users. These measures include access control, data encryption, and secure server storage. All data stored in our database is encrypted. Including the developer cannot see this data';
			case 'privacy.question6': return 'User Rights';
			case 'privacy.answer6': return 'Users have the right to control and manage the personal information collected in our application. Users can edit their personal information in the account settings section, and can request deletion of their accounts or deletion of data collected by the application at any time';
			case 'privacy.question7': return 'Changes';
			case 'privacy.answer7': return 'We reserve the right to make changes to our privacy policy. Any changes to this policy will be posted on this page and notified to our users';
			case 'privacy.writtenBy': return 'Written by TypeTek';
			case 'privacy.writtenDate': return 'Jan 18, 2023';
			case 'register.title': return 'Create account';
			case 'register.text': return 'Let’s get started your journey by creating an account';
			case 'register.username': return 'username';
			case 'register.password': return 'password';
			case 'register.confirmPassword': return 'confirm password';
			case 'register.signUp': return 'SING UP';
			case 'register.orSignUp': return 'Or sign up with';
			case 'register.alreadyHaveAccount': return 'Already have an account?';
			case 'register.login': return 'Login';
			case 'register.snackbar.accountCreated': return 'Account created';
			case 'register.snackbar.passwordsDontMatch': return 'Passwords do not match';
			case 'register.snackbar.usernameShouldBe': return 'Username must be between 6-15 characters';
			case 'register.snackbar.passwordShouldBe': return 'Password must be between 8-25 characters';
			case 'register.snackbar.takenUsername': return 'Username taken';
			case 'register.snackbar.blankMustFilled': return 'All blanks must be filled';
			case 'register.snackbar.reEnterError': return 'An error occurred please re-enter the app';
			case 'login.title': return 'Welcome Back!';
			case 'login.text': return 'Sign in to accsess your personalized experience';
			case 'login.username': return 'username';
			case 'login.password': return 'password';
			case 'login.login': return 'LOGIN';
			case 'login.forgorPassword': return 'Forgot password?';
			case 'login.orLogin': return 'Or login with';
			case 'login.dontHaveAccount': return 'Don’t have an account?';
			case 'login.signUp': return 'Sign Up';
			case 'login.snackbar.loggedIn': return 'logged in';
			case 'login.snackbar.invalidPassword': return 'Invalid password';
			case 'login.snackbar.accountNotFound': return 'Account not found';
			case 'login.snackbar.blankMustFilled': return 'All blanks must be filled';
			case 'login.snackbar.reEnterError': return 'An error occurred please re-enter the app';
			case 'newhabit.appbar': return 'ADD NEW';
			case 'newhabit.icon': return 'Icon';
			case 'newhabit.title': return 'Title';
			case 'newhabit.titleHint': return 'Write a title';
			case 'newhabit.description': return 'Description';
			case 'newhabit.descriptionHint': return 'Write a description';
			case 'newhabit.category': return 'Category';
			case 'newhabit.categoryHint': return 'Write category';
			case 'newhabit.start': return 'Start';
			case 'newhabit.startHint': return 'Start date';
			case 'newhabit.end': return 'End';
			case 'newhabit.endHint': return 'End date';
			case 'newhabit.time': return 'Time';
			case 'newhabit.timeHint': return 'Select time';
			case 'newhabit.reminder': return 'Reminder';
			case 'newhabit.before5m': return 'bfr. 5m';
			case 'newhabit.before30m': return 'bfr. 30m';
			case 'newhabit.before1h': return 'bfr. 1h';
			case 'newhabit.onTime': return 'on time';
			case 'newhabit.disable': return 'Disable';
			case 'newhabit.type': return 'Type';
			case 'newhabit.toDo': return 'To do';
			case 'newhabit.notToDo': return 'Not to do';
			case 'newhabit.frequency': return 'Frequency';
			case 'newhabit.everyDay': return 'Every Day';
			case 'newhabit.monday': return 'Monday';
			case 'newhabit.tuesday': return 'Tuesday';
			case 'newhabit.wednesday': return 'Wednesday';
			case 'newhabit.thursday': return 'Thursday';
			case 'newhabit.friday': return 'Friday';
			case 'newhabit.saturday': return 'Saturday';
			case 'newhabit.sunday': return 'Sunday';
			case 'newhabit.create': return 'CREATE';
			case 'newhabit.cancel': return 'CANCEL';
			case 'newhabit.edit': return 'EDIT';
			case 'newhabit.snackbar.habitCreated': return 'Habit created';
			case 'newhabit.snackbar.blankMustFilled': return 'All blanks must be filled';
			case 'newhabit.snackbar.categoryCannotLong': return 'Category cannot exceed 20 characters';
			case 'newhabit.snackbar.titleCannotLong': return 'Title cannot exceed 25 characters';
			case 'home.thisWeek': return 'This week';
			case 'home.today': return 'Today';
			case 'home.yesterday': return 'Yesterday';
			case 'home.ago': return 'ago';
			case 'home.days': return 'days';
			case 'home.tomorrow': return 'Tomorrow';
			case 'home.later': return 'later';
			case 'home.success': return 'SUCCESS';
			case 'home.failure': return 'FAILURE';
			case 'home.enterComplete': return 'Enter Complate Comment';
			case 'home.complate': return 'Complate';
			case 'home.blankList': return 'No habits for the day';
			case 'stats.allHabits': return 'All Habits';
			case 'stats.blankList': return 'No habit yet';
			case 'info.appbar': return 'Habit info';
			case 'info.description': return 'Description';
			case 'info.startDate': return 'Start date';
			case 'info.endDate': return 'End Date';
			case 'info.category': return 'Category';
			case 'info.type': return 'Type';
			case 'info.toDo': return 'To do';
			case 'info.notToDo': return 'Not to do';
			case 'info.reminder': return 'Reminder';
			case 'info.before5m': return 'Bfr5m';
			case 'info.before30m': return 'Bfr30m';
			case 'info.before1h': return 'bfr1h';
			case 'info.onTime': return 'On Time';
			case 'info.disable': return 'Disable';
			case 'info.time': return 'Time';
			case 'info.Frequency': return 'Frequency';
			case 'info.complateComment': return 'Complate comment';
			case 'info.delete': return 'DELETE';
			case 'info.edit': return 'EDIT';
			default: return null;
		}
	}
}

extension on _StringsTr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.companyName': return 'TypeTek';
			case 'common.appName': return 'Habiter';
			case 'common.exit': return 'ÇIKIŞ';
			case 'common.cancel': return 'İPTAL';
			case 'common.doExitApp': return 'Uygulamadan çıkmak mı istiyorsun?';
			case 'common.home': return 'Ana sayfa';
			case 'common.neww': return 'Yeni';
			case 'common.stats': return 'İstistikler';
			case 'common.snackbar.comingSoon': return 'Çok yakında...';
			case 'intro.appbar': return 'TypeTek\'den Habiter';
			case 'intro.title0': return 'Hedeflerini belirle';
			case 'intro.text0': return 'Uygulamamızda günlük hedefler belirleyerek daha disiplinli bir yaşam tarzı sürdürebilirsiniz.';
			case 'intro.title1': return 'Alışkanlıklarınızı Takip Edin';
			case 'intro.text1': return 'Habiter, alışkanlıklarınızı takip ederek günlük, haftalık ve aylık hedeflerinize ulaşmanıza yardımcı olur.';
			case 'intro.title2': return 'Kişisel Raporlar Alın';
			case 'intro.text2': return 'Uygulama, size günlük etkinliklerinizin ayrıntılı analizini sunan kişisel raporlar sunar.';
			case 'intro.skip': return ' GEÇ ';
			case 'intro.next': return 'İLERİ';
			case 'settings.appbar': return 'Ayarlar';
			case 'settings.notification': return 'Bildirimler';
			case 'settings.language': return 'Dil';
			case 'settings.darkMode': return 'Koyu tema';
			case 'settings.ads': return 'Reklamlar';
			case 'settings.backup': return 'Yedekleme';
			case 'settings.report': return 'Rapor';
			case 'settings.privacy': return 'Gizlilik politikası';
			case 'settings.about': return 'Hakkında';
			case 'settings.rate': return 'Bize puan verin';
			case 'settings.logout': return 'Çıkış';
			case 'settings.version': return 'Versiyon';
			case 'settings.english': return 'İngilizce';
			case 'settings.turkish': return 'Türkçe';
			case 'settings.keep': return 'AÇIK TUT';
			case 'settings.close': return 'KAPAT';
			case 'settings.selectLanguage': return 'Dil seç';
			case 'settings.adAlertText': return 'Reklamları kapatma özelliği tüm kullanıcılara ücretsiz şekilde sunulur. Ancak geliştiriciye destek amaçlı açık bırakmanız önerilir';
			case 'settings.backupAlertText': return 'Yedeklemeyi kapattığınızda hesabınıza ait tüm veriler cihazınızda saklanır. Diğer cihazlardan erişilemez';
			case 'about.appbar': return 'Hakkımızda';
			case 'about.companyText': return 'Habiter bir TypeTek ürünüdür. Ücretsizdir ve kişisel kullanımlar için sunulur';
			case 'about.question0': return 'TypeTek nedir?';
			case 'about.answer0': return 'TypeTek verimlilik ve kişisel gelişim alanlarında dijital hizmetler sunan bir bireysel girişimdir.';
			case 'about.question1': return 'Habiter nedir?';
			case 'about.answer1': return 'TypeTek verimlilik ve kişisel gelişim alanlarında dijital hizmetler sunan bir bireysel girişimdir.';
			case 'about.question2': return 'Habiter nasıl daha verimli kullanılır?';
			case 'about.answer2': return 'TypeTek verimlilik ve kişisel gelişim alanlarında dijital hizmetler sunan bir bireysel girişimdir.';
			case 'report.appbar': return 'Rapor gönder';
			case 'report.labelTitle': return 'Başlık';
			case 'report.hintTitle': return 'Rapor için başlık yaz';
			case 'report.labelDescription': return 'Açıklama';
			case 'report.hintDescription': return 'Bir açıklama yaz';
			case 'report.labelType': return 'Tip';
			case 'report.hintType': return 'Bir tip yaz';
			case 'report.labelEmail': return 'E-posta';
			case 'report.hintEmail': return 'E-mail adresini yaz';
			case 'report.reportNote': return 'Not: Lütfen doğru bilgi içeren bir rapor gönderiniz. Yanlış bildirimler uygulamanın olumlu yönde geliştirilmesine engel olmaktadır. Ayrıca rapor bildirimleriniz için teşekkür ederiz';
			case 'report.report': return 'RAPOR';
			case 'report.snackbar.thanksReport': return 'Rapor için teşekkürler';
			case 'report.snackbar.blankMustFilled': return 'Tüm boşluklar doldurulmalıdır';
			case 'privacy.appbar': return 'Gizlilik politikası';
			case 'privacy.question0': return 'Bu gizlilik politikası kim tarafından hazırlanmıştır?';
			case 'privacy.answer0': return 'Bu gizlilik politikası bütünü ile geliştirici tarafından bireysel olarak yazılmıştır. Herhangi bir kurum veya şirket ile bağlantısı yoktur.';
			case 'privacy.question1': return 'Gizlilik politikasının amacı nedir?';
			case 'privacy.answer1': return 'Bu gizlilik politikası, kullanıcılarımızın kişisel bilgilerinin toplanması, kullanımı ve ifşa edilmesiyle ilgili açıklamaları içermektedir.';
			case 'privacy.question2': return 'Bilgi Toplama';
			case 'privacy.answer2': return 'Kullanıcılardan toplanan bilgiler, sadece uygulamamızın işlevlerini yerine getirmek için gereklidir. Bu bilgiler, kullanıcılar tarafından sağlanan form veya hesap oluşturma sayfasında toplanabilir.';
			case 'privacy.question3': return 'Bilgi Kullanımı';
			case 'privacy.answer3': return 'Toplanan bilgiler sadece uygulamamızın geliştirilmesi ve iyileştirilmesi için kullanılır. Bu bilgiler, kullanıcı deneyiminin geliştirilmesi, sorun giderme ve hizmetlerimizin iyileştirilmesi için kullanılabilir.';
			case 'privacy.question4': return 'Bilgi Paylaşımı';
			case 'privacy.answer4': return 'Kullanıcıların kişisel bilgileri asla üçüncü taraflarla paylaşılmayacaktır.';
			case 'privacy.question5': return 'Bilgi Güvenliği';
			case 'privacy.answer5': return 'Kullanıcıların kişisel bilgilerinin güvenliği bizim için önemlidir. Bu nedenle, kullanıcıların kişisel bilgilerini korumak için çeşitli güvenlik önlemleri alınmaktadır. Bu önlemler, erişim kontrolü, veri şifreleme ve güvenli sunucu depolamasını içerir. Veritabanımızda depolanan tüm veriler şifrelidir. Geliştirici dahil bu verileri göremez.';
			case 'privacy.question6': return 'Kullanıcı Hakları';
			case 'privacy.answer6': return 'Kullanıcılar, uygulamamızda toplanan kişisel bilgileri kontrol etme ve yönetme hakkına sahiptir. Kullanıcılar, hesap ayarları bölümünden kişisel bilgilerini düzenleyebilir, istedikleri zaman hesaplarını silme veya uygulama tarafından toplanan verilerin silinmesi talebinde bulunabilirler.';
			case 'privacy.question7': return 'Değişiklikler';
			case 'privacy.answer7': return 'Gizlilik politikamızda değişiklik yapma hakkımız saklıdır. Bu politikada yapılacak herhangi bir değişiklik, bu sayfada yayınlanacak ve kullanıcılarımıza bildirilecektir.';
			case 'privacy.writtenBy': return 'TypeTek tarafından yazılmıştır.';
			case 'privacy.writtenDate': return 'Ocak 18, 2023';
			case 'register.title': return 'Hesap oluştur';
			case 'register.text': return 'Bir hesap oluşturarak yolculuğunuza başlayalım';
			case 'register.username': return 'kullanıcı adı';
			case 'register.password': return 'şifre';
			case 'register.confirmPassword': return 'şifreyi onayla';
			case 'register.signUp': return 'KAYIT OL';
			case 'register.orSignUp': return 'veya ile kayıt ol';
			case 'register.alreadyHaveAccount': return 'Zaten hesabınız var mı?';
			case 'register.login': return 'Giriş yap';
			case 'register.snackbar.accountCreated': return 'Hesap oluşturuldu';
			case 'register.snackbar.passwordsDontMatch': return 'Şifreler uyuşmuyor';
			case 'register.snackbar.usernameShouldBe': return 'Kullanıcı adı 6-15 karakter arasında olmalıdır';
			case 'register.snackbar.passwordShouldBe': return 'Şifre adı 8-25 karakter arasında olmalıdır';
			case 'register.snackbar.takenUsername': return 'Kullanıcı adı alınmış';
			case 'register.snackbar.blankMustFilled': return 'Tüm boşluklar doldurulmalıdır';
			case 'register.snackbar.reEnterError': return 'Bir hata oluştu lütfen uygulamaya tekrar girin';
			case 'login.title': return 'Tekrar hoşgeldiniz!';
			case 'login.text': return 'Kişiselleştirilmiş deneyiminize erişmek için oturum açın';
			case 'login.username': return 'kullanıcı adı';
			case 'login.password': return 'şifre';
			case 'login.login': return 'GİRİŞ YAP';
			case 'login.forgorPassword': return 'şifreni mi unuttun';
			case 'login.orLogin': return 'veya giriş yap';
			case 'login.dontHaveAccount': return 'Bir hsabın yok mu?';
			case 'login.signUp': return 'Kayıt ol';
			case 'login.snackbar.loggedIn': return 'Giriş yapıldı';
			case 'login.snackbar.invalidPassword': return 'Geçersiz şifre';
			case 'login.snackbar.accountNotFound': return 'Hesap bulunamadı';
			case 'login.snackbar.blankMustFilled': return 'Tüm boşluklar doldurulmalıdır';
			case 'login.snackbar.reEnterError': return 'Bir hata oluştu lütfen uygulamaya tekrar girin';
			case 'newhabit.appbar': return 'YENİ EKLE';
			case 'newhabit.icon': return 'Simge';
			case 'newhabit.title': return 'Başlık';
			case 'newhabit.titleHint': return 'Bir başlık yaz';
			case 'newhabit.description': return 'Açıklama';
			case 'newhabit.descriptionHint': return 'Bir açıklama yaz';
			case 'newhabit.category': return 'Kategori';
			case 'newhabit.categoryHint': return 'Bir kategori yaz';
			case 'newhabit.start': return 'Başlangıç';
			case 'newhabit.startHint': return 'Başangıç tarihi';
			case 'newhabit.end': return 'Bitiş';
			case 'newhabit.endHint': return 'Bitiş tarihi';
			case 'newhabit.time': return 'Saat';
			case 'newhabit.timeHint': return 'Saat seç';
			case 'newhabit.reminder': return 'Hatırlatıcı';
			case 'newhabit.before5m': return '5dk ö';
			case 'newhabit.before30m': return '30dk ö';
			case 'newhabit.before1h': return '1s ö';
			case 'newhabit.onTime': return 'zmnda';
			case 'newhabit.disable': return 'dvre dşı';
			case 'newhabit.type': return 'Tip';
			case 'newhabit.toDo': return 'Yapılacak';
			case 'newhabit.notToDo': return 'Yapılmayacak';
			case 'newhabit.frequency': return 'Sıklık';
			case 'newhabit.everyDay': return 'Her gün';
			case 'newhabit.monday': return 'Pazartesi';
			case 'newhabit.tuesday': return 'Salı';
			case 'newhabit.wednesday': return 'Çarşamba';
			case 'newhabit.thursday': return 'Perşembe';
			case 'newhabit.friday': return 'Cuma';
			case 'newhabit.saturday': return 'Cumartesi';
			case 'newhabit.sunday': return 'Pazar';
			case 'newhabit.create': return 'OLUŞTUR';
			case 'newhabit.cancel': return 'İPTAL';
			case 'newhabit.edit': return 'DÜZENLE';
			case 'newhabit.snackbar.habitCreated': return 'Habit oluşturuldu';
			case 'newhabit.snackbar.blankMustFilled': return 'Tüm boşluklar doldurulmalıdır';
			case 'newhabit.snackbar.categoryCannotLong': return 'Kategori 20 karakterden fazla olamaz';
			case 'newhabit.snackbar.titleCannotLong': return 'Başlık 25 karakterden fazla olamaz';
			case 'home.thisWeek': return 'Bu hafta';
			case 'home.today': return 'Bugün';
			case 'home.yesterday': return 'Dün';
			case 'home.ago': return 'önce';
			case 'home.days': return 'gün';
			case 'home.tomorrow': return 'Yarın';
			case 'home.later': return 'sonra';
			case 'home.success': return 'BAŞARI';
			case 'home.failure': return 'BAŞARISIZLIK';
			case 'home.enterComplete': return 'Tamamlanma yorumu gir';
			case 'home.complate': return 'Tamamla';
			case 'home.blankList': return 'İlgili gün için bir habit yok';
			case 'stats.allHabits': return 'Tüm alışkanlıklar';
			case 'stats.blankList': return 'Henüz hiç alışkanlık yok';
			case 'info.appbar': return 'Habit bilgi';
			case 'info.description': return 'Açıklama';
			case 'info.startDate': return 'Başlangıç';
			case 'info.endDate': return 'Bitiş';
			case 'info.category': return 'Kategori';
			case 'info.type': return 'Tip';
			case 'info.toDo': return 'Yapılacak';
			case 'info.notToDo': return 'Yapılmayacak';
			case 'info.reminder': return 'Hatırlatıcı';
			case 'info.before5m': return '5 dk ö';
			case 'info.before30m': return '30dk ö';
			case 'info.before1h': return '1s ö';
			case 'info.onTime': return 'Zamanında';
			case 'info.disable': return 'Kapalı';
			case 'info.time': return 'Saat';
			case 'info.Frequency': return 'Sıklık';
			case 'info.complateComment': return 'Tamamlama yorumu';
			case 'info.delete': return 'SİL';
			case 'info.edit': return 'DÜZENLE';
			default: return null;
		}
	}
}
