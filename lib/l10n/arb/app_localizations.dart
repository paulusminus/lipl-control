import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_nl.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('nl')
  ];

  /// Edit/new Playlist Add lyric label
  ///
  /// In en, this message translates to:
  /// **'Add lyric'**
  String get addLyric;

  /// Preferences Base URL label
  ///
  /// In en, this message translates to:
  /// **'Base URL'**
  String get baseUrlLabel;

  /// Bigger font on display server
  ///
  /// In en, this message translates to:
  /// **'Bigger'**
  String get bigger;

  /// Cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButtonLabel;

  /// Title of confirm dialog
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Asking for confirmation to poweroff Display server
  ///
  /// In en, this message translates to:
  /// **'Poweroff Display server?'**
  String get confirmPoweroff;

  /// Dark theme
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// Delete in confirmation delete dialog
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Delete button label
  ///
  /// In en, this message translates to:
  /// **'delete'**
  String get deleteButtonLabel;

  /// Edit button label
  ///
  /// In en, this message translates to:
  /// **'edit'**
  String get editButtonLabel;

  /// Edit / new Lyric title
  ///
  /// In en, this message translates to:
  /// **'Edit lyric'**
  String get editLyric;

  /// Edit / new playlist title
  ///
  /// In en, this message translates to:
  /// **'Edit playlist'**
  String get editPlaylist;

  /// Play first icon label
  ///
  /// In en, this message translates to:
  /// **'Begin'**
  String get first;

  /// Play last icon label
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get last;

  /// Light theme
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// The title of the main program
  ///
  /// In en, this message translates to:
  /// **'Lipl'**
  String get liplTitle;

  /// Lyrics
  ///
  /// In en, this message translates to:
  /// **'Lyrics'**
  String get lyrics;

  /// New lyric
  ///
  /// In en, this message translates to:
  /// **'New lyric'**
  String get newLyric;

  /// New playlist
  ///
  /// In en, this message translates to:
  /// **'New playlist'**
  String get newPlaylist;

  /// Play next icon label
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Ok button label
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get okButtonLabel;

  /// Preferences password label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// Main play button label
  ///
  /// In en, this message translates to:
  /// **'play'**
  String get playButtonLabel;

  /// Play titel
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get playPageTitle;

  /// Preferences page title
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// Notice of changed preferences
  ///
  /// In en, this message translates to:
  /// **'Preferences Changed'**
  String get preferencesChanged;

  /// Play previous icon label
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// Poweroff display server
  ///
  /// In en, this message translates to:
  /// **'Poweroff'**
  String get poweroff;

  /// Save button label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButtonLabel;

  /// Search lyric page title
  ///
  /// In en, this message translates to:
  /// **'Search lyric'**
  String get searchPageTitle;

  /// Label for title contains field
  ///
  /// In en, this message translates to:
  /// **'Title contains'**
  String get searchTitleContains;

  /// Search button label
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchButtonLabel;

  /// Search lyric minimal characters error
  ///
  /// In en, this message translates to:
  /// **'Minimal of 3 letters please'**
  String get searchMinimalCharsError;

  /// Indicate no search results
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get searchNoResults;

  /// Indicate search results
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchDoesHaveResults;

  /// Lyric search results for
  ///
  /// In en, this message translates to:
  /// **'results for'**
  String get searchResultsFor;

  /// Select display server page title
  ///
  /// In en, this message translates to:
  /// **'Select display server'**
  String get selectDisplayServerTitle;

  /// Smaller font on display server
  ///
  /// In en, this message translates to:
  /// **'Smaller'**
  String get smaller;

  /// Edit Lyric text label
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get textLabel;

  /// Edit Lyric c.q. Playlist title label
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titleLabel;

  /// Access needs authentication
  ///
  /// In en, this message translates to:
  /// **'Unauthorized'**
  String get unauthorized;

  /// Preferences username label
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameLabel;

  /// Name of the screen where users can pick one
  ///
  /// In en, this message translates to:
  /// **'TV Connections'**
  String get bluetoothScreenName;

  /// Connected to status message
  ///
  /// In en, this message translates to:
  /// **'Connected to'**
  String get bluetoothConnectedTo;

  /// Just a moment
  ///
  /// In en, this message translates to:
  /// **'Just a moment...'**
  String get justAMoment;

  /// Name
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Version
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Repository
  ///
  /// In en, this message translates to:
  /// **'Repository'**
  String get repository;

  /// Description
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// App Description
  ///
  /// In en, this message translates to:
  /// **'Maintenance of lyrics and playlists'**
  String get appDescription;

  /// App Repository
  ///
  /// In en, this message translates to:
  /// **'https://github.com/paulusminus/lipl-control/'**
  String get appRepository;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'nl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'nl': return AppLocalizationsNl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
