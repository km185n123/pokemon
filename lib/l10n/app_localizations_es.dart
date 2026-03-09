// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Pokemon';

  @override
  String get searchHint => 'Buscar pokemon...';

  @override
  String get description => 'Descripción';

  @override
  String get retry => 'Reintentar';

  @override
  String get connectionLost => 'Conexión Perdida';

  @override
  String get connectionLostMessage =>
      'No hay conexión a internet. Por favor verifica tu red.';

  @override
  String get serverError => 'Algo salió mal';

  @override
  String get serverErrorMessage =>
      'El servidor no está disponible. Intenta más tarde.';

  @override
  String get genericError => '¡Ups! Algo salió mal';
}
