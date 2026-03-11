// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Pokédex';

  @override
  String get searchHint => 'Search Pokémon...';

  @override
  String get filterButton => 'Filter';

  @override
  String get applyFilter => 'Apply Filter';

  @override
  String get clearFilter => 'Clear Filter';

  @override
  String filterResultsCount(int count) {
    return '$count results found';
  }

  @override
  String get description => 'Description';

  @override
  String get noDescription => 'No description available.';

  @override
  String get statWeight => 'WEIGHT';

  @override
  String get statHeight => 'HEIGHT';

  @override
  String get statCategory => 'CATEGORY';

  @override
  String get statAbility => 'ABILITY';

  @override
  String get weaknesses => 'Weaknesses';

  @override
  String get gender => 'Gender';

  @override
  String get genderMale => 'Male';

  @override
  String get genderFemale => 'Female';

  @override
  String get genderGenderless => 'Genderless';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get favoritesEmpty => 'You haven\'t marked any\nPokémon as favorite';

  @override
  String get favoritesEmptySubtitle =>
      'Tap the heart icon on your favorite\nPokémon and they will appear here.';

  @override
  String favoritesRemovedSnackbar(String name) {
    return '$name removed from favorites';
  }

  @override
  String get tutorialPage1Title => 'All Pokémon in\none place';

  @override
  String get tutorialPage1Subtitle =>
      'Access a wide list of Pokémon from all generations created by Nintendo';

  @override
  String get tutorialPage2Title => 'Keep your Pokédex\nup to date';

  @override
  String get tutorialPage2Subtitle =>
      'Register and save your profile, favorite Pokémon, settings, and much more in the app';

  @override
  String get tutorialContinue => 'Continue';

  @override
  String get tutorialGetStarted => 'Let\'s Go';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsEnableCache => 'Enable Database Cache';

  @override
  String get settingsEnableCacheSubtitle =>
      'Pokémon list will be saved locally for offline browsing';

  @override
  String get offlineBanner => 'No Internet Connection';

  @override
  String get errorTitle => 'Something went wrong...';

  @override
  String get errorSubtitle =>
      'We couldn\'t load the information right now. Check your connection or try again later.';

  @override
  String get retry => 'Retry';

  @override
  String get connectionLost => 'Connection Lost';

  @override
  String get connectionLostMessage =>
      'No internet connection. Please check your network settings.';

  @override
  String get serverError => 'Something went wrong';

  @override
  String get serverErrorMessage =>
      'Server is currently unavailable. Please try again later.';

  @override
  String get navPokedex => 'Pokédex';

  @override
  String get navFavorites => 'Favorites';

  @override
  String get navRegions => 'Regions';

  @override
  String get navProfile => 'Profile';

  @override
  String get filterTitle => 'Filter by your preferences';

  @override
  String get filterTypeLabel => 'Type';

  @override
  String get filterApply => 'Apply';

  @override
  String get filterCancel => 'Cancel';

  @override
  String get genericError => 'Oops! Something went wrong';
}
