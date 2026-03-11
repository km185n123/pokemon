import 'package:pokemon/features/landing/data/dto/pokemon_detail_dto.dart';
import 'package:pokemon/features/landing/data/dto/pokemon_species_dto.dart';
import 'package:pokemon/features/detailpokemon/domain/entities/pokemon_detail.dart';

extension PokemonDetailMapper on PokemonDetailDto {
  PokemonDetail toEntity(PokemonSpeciesDto speciesDto) {
    // Extract Description (first English entry, fallback to any)
    String description = '';
    final flavorTexts = speciesDto.flavorTextEntries;
    if (flavorTexts.isNotEmpty) {
      final enEntry = flavorTexts.firstWhere(
        (entry) => entry.language.name == 'en',
        orElse: () => flavorTexts.first,
      );
      description = enEntry.flavorText.replaceAll(RegExp(r'[\n\f]'), ' ');
    }

    // Extract Category (first English entry, fallback to any)
    String category = '';
    final genera = speciesDto.genera;
    if (genera.isNotEmpty) {
      final enGenus = genera.firstWhere(
        (g) => g.language.name == 'en',
        orElse: () => genera.first,
      );
      category = enGenus.genus.replaceAll(' Pokémon', '');
    }

    // Extract Abilities
    final abilityStr = abilities.isNotEmpty
        ? abilities.first.ability.name
        : 'Unknown';

    // Calculate Gender Rates
    double femalePercentage = 0;
    double malePercentage = 0;

    if (speciesDto.genderRate != -1) {
      femalePercentage = (speciesDto.genderRate / 8.0) * 100;
      malePercentage = 100 - femalePercentage;
    }

    final typesList = types.map((e) => e.type.name).toList();
    final weaknessesList = typesList; // Mocked to actual types for now

    final heightMeters = height / 10.0;
    final weightKg = weight / 10.0;

    return PokemonDetail(
      id: id,
      name: name,
      image: sprites.other?.officialArtwork?.frontDefault ?? '',
      types: typesList,
      height: heightMeters,
      weight: weightKg,
      description: description,
      category: category,
      ability: abilityStr,
      malePercentage: malePercentage,
      femalePercentage: femalePercentage,
      weaknesses: weaknessesList,
    );
  }
}
