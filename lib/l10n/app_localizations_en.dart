// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Pokemon';

  @override
  String get searchHint => 'Search pokemon...';

  @override
  String get description => 'Description';

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
  String get genericError => 'Oops! Something went wrong';
}
