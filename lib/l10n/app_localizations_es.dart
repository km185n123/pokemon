// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Pokédex';

  @override
  String get searchHint => 'Buscar Pokémon...';

  @override
  String get filterButton => 'Filtrar';

  @override
  String get applyFilter => 'Aplicar Filtro';

  @override
  String get clearFilter => 'Borrar Filtro';

  @override
  String filterResultsCount(int count) {
    return '$count resultados encontrados';
  }

  @override
  String get description => 'Descripción';

  @override
  String get noDescription => 'Sin descripción disponible.';

  @override
  String get statWeight => 'PESO';

  @override
  String get statHeight => 'ALTURA';

  @override
  String get statCategory => 'CATEGORÍA';

  @override
  String get statAbility => 'HABILIDAD';

  @override
  String get weaknesses => 'Debilidades';

  @override
  String get gender => 'Género';

  @override
  String get genderMale => 'Macho';

  @override
  String get genderFemale => 'Hembra';

  @override
  String get genderGenderless => 'Sin género';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get favoritesEmpty => 'No has marcado ningún\nPokémon como favorito';

  @override
  String get favoritesEmptySubtitle =>
      'Haz clic en el ícono de corazón de tus\nPokémon favoritos y aparecerán aquí.';

  @override
  String favoritesRemovedSnackbar(String name) {
    return '$name eliminado de favoritos';
  }

  @override
  String get tutorialPage1Title => 'Todos los Pokémon en\nun solo lugar';

  @override
  String get tutorialPage1Subtitle =>
      'Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo';

  @override
  String get tutorialPage2Title => 'Mantén tu Pokédex\nactualizada';

  @override
  String get tutorialPage2Subtitle =>
      'Regístrate y guarda tu perfil, Pokémon favoritos, configuraciones y mucho más en la aplicación';

  @override
  String get tutorialContinue => 'Continuar';

  @override
  String get tutorialGetStarted => 'Empecemos';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get settingsEnableCache => 'Activar Base de Datos (Caché)';

  @override
  String get settingsEnableCacheSubtitle =>
      'La lista de Pokémon se guardará localmente para navegación sin internet';

  @override
  String get offlineBanner => 'Sin conexión a Internet';

  @override
  String get errorTitle => 'Algo salió mal...';

  @override
  String get errorSubtitle =>
      'No pudimos cargar la información en este momento. Verifica tu conexión o intenta nuevamente más tarde.';

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
  String get navPokedex => 'Pokédex';

  @override
  String get navFavorites => 'Favoritos';

  @override
  String get navRegions => 'Regiones';

  @override
  String get navProfile => 'Perfil';

  @override
  String get filterTitle => 'Filtra por tus preferencias';

  @override
  String get filterTypeLabel => 'Tipo';

  @override
  String get filterApply => 'Aplicar';

  @override
  String get filterCancel => 'Cancelar';

  @override
  String get genericError => '¡Ups! Algo salió mal';
}
