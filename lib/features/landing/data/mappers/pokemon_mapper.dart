import 'package:pokemon/features/landing/data/dto/pokemon_detail_dto.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';

extension PokemonModelMapper on PokemonDetailDto {
  Pokemon toEntity() {
    return Pokemon(
      id: id,
      name: name,
      image:
          sprites.other?.officialArtwork?.frontDefault ??
          sprites.frontDefault ??
          '',
      types: types.map((t) => t.type.name).toList(),
    );
  }
}
