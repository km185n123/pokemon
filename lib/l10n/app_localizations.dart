import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// The application title
  ///
  /// In en, this message translates to:
  /// **'Pokédex'**
  String get appTitle;

  /// Search bar placeholder
  ///
  /// In en, this message translates to:
  /// **'Search Pokémon...'**
  String get searchHint;

  /// Filter button label
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filterButton;

  /// Apply filter button
  ///
  /// In en, this message translates to:
  /// **'Apply Filter'**
  String get applyFilter;

  /// Clear filter button
  ///
  /// In en, this message translates to:
  /// **'Clear Filter'**
  String get clearFilter;

  /// How many results after filter
  ///
  /// In en, this message translates to:
  /// **'{count} results found'**
  String filterResultsCount(int count);

  /// Section header for Pokémon description
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Fallback when no description is available
  ///
  /// In en, this message translates to:
  /// **'No description available.'**
  String get noDescription;

  /// Pokémon weight label
  ///
  /// In en, this message translates to:
  /// **'WEIGHT'**
  String get statWeight;

  /// Pokémon height label
  ///
  /// In en, this message translates to:
  /// **'HEIGHT'**
  String get statHeight;

  /// Pokémon category label
  ///
  /// In en, this message translates to:
  /// **'CATEGORY'**
  String get statCategory;

  /// Pokémon ability label
  ///
  /// In en, this message translates to:
  /// **'ABILITY'**
  String get statAbility;

  /// Section header for weaknesses
  ///
  /// In en, this message translates to:
  /// **'Weaknesses'**
  String get weaknesses;

  /// Section header for gender
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// Male gender label
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// Female gender label
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// Genderless label
  ///
  /// In en, this message translates to:
  /// **'Genderless'**
  String get genderGenderless;

  /// Title for favorites screen
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritesTitle;

  /// Empty title on favorites screen
  ///
  /// In en, this message translates to:
  /// **'You haven\'t marked any\nPokémon as favorite'**
  String get favoritesEmpty;

  /// Empty subtitle on favorites screen
  ///
  /// In en, this message translates to:
  /// **'Tap the heart icon on your favorite\nPokémon and they will appear here.'**
  String get favoritesEmptySubtitle;

  /// Snackbar when a Pokémon is removed
  ///
  /// In en, this message translates to:
  /// **'{name} removed from favorites'**
  String favoritesRemovedSnackbar(String name);

  /// Tutorial page 1 title
  ///
  /// In en, this message translates to:
  /// **'All Pokémon in\none place'**
  String get tutorialPage1Title;

  /// Tutorial page 1 subtitle
  ///
  /// In en, this message translates to:
  /// **'Access a wide list of Pokémon from all generations created by Nintendo'**
  String get tutorialPage1Subtitle;

  /// Tutorial page 2 title
  ///
  /// In en, this message translates to:
  /// **'Keep your Pokédex\nup to date'**
  String get tutorialPage2Title;

  /// Tutorial page 2 subtitle
  ///
  /// In en, this message translates to:
  /// **'Register and save your profile, favorite Pokémon, settings, and much more in the app'**
  String get tutorialPage2Subtitle;

  /// Tutorial continue button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get tutorialContinue;

  /// Tutorial final button
  ///
  /// In en, this message translates to:
  /// **'Let\'s Go'**
  String get tutorialGetStarted;

  /// Title for settings/profile screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Toggle label for database cache
  ///
  /// In en, this message translates to:
  /// **'Enable Database Cache'**
  String get settingsEnableCache;

  /// Subtitle for database cache toggle
  ///
  /// In en, this message translates to:
  /// **'Pokémon list will be saved locally for offline browsing'**
  String get settingsEnableCacheSubtitle;

  /// Text shown in offline banner
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get offlineBanner;

  /// Generic error title on landing
  ///
  /// In en, this message translates to:
  /// **'Something went wrong...'**
  String get errorTitle;

  /// Generic error subtitle on landing
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t load the information right now. Check your connection or try again later.'**
  String get errorSubtitle;

  /// Retry button label
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Network failure title
  ///
  /// In en, this message translates to:
  /// **'Connection Lost'**
  String get connectionLost;

  /// Network failure message
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Please check your network settings.'**
  String get connectionLostMessage;

  /// Server error title
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get serverError;

  /// Server error message
  ///
  /// In en, this message translates to:
  /// **'Server is currently unavailable. Please try again later.'**
  String get serverErrorMessage;

  /// Bottom nav: Pokédex tab
  ///
  /// In en, this message translates to:
  /// **'Pokédex'**
  String get navPokedex;

  /// Bottom nav: Favorites tab
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get navFavorites;

  /// Bottom nav: Regions tab
  ///
  /// In en, this message translates to:
  /// **'Regions'**
  String get navRegions;

  /// Bottom nav: Profile tab
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// Filter bottom sheet title
  ///
  /// In en, this message translates to:
  /// **'Filter by your preferences'**
  String get filterTitle;

  /// Filter section label for Pokémon type
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get filterTypeLabel;

  /// Apply filter button
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get filterApply;

  /// Cancel filter button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get filterCancel;

  /// Generic fallback error
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong'**
  String get genericError;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
