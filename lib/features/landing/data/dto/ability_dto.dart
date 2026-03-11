import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/features/landing/data/dto/ability_detail_dto.dart';

part 'ability_dto.freezed.dart';
part 'ability_dto.g.dart';

@freezed
abstract class AbilityDto with _$AbilityDto {
  const factory AbilityDto({required AbilityDetailDto ability}) = _AbilityDto;

  factory AbilityDto.fromJson(Map<String, dynamic> json) =>
      _$AbilityDtoFromJson(json);
}
