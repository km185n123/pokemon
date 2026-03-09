import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_result_dto.freezed.dart';
part 'pokemon_result_dto.g.dart';

@freezed
abstract class PokemonResultDto with _$PokemonResultDto {
  const factory PokemonResultDto({required String name, required String url}) =
      _PokemonResultDto;

  factory PokemonResultDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonResultDtoFromJson(json);
}
