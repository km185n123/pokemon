import 'package:freezed_annotation/freezed_annotation.dart';

part 'ability_detail_dto.freezed.dart';
part 'ability_detail_dto.g.dart';

@freezed
abstract class AbilityDetailDto with _$AbilityDetailDto {
  const factory AbilityDetailDto({required String name, required String url}) =
      _AbilityDetailDto;

  factory AbilityDetailDto.fromJson(Map<String, dynamic> json) =>
      _$AbilityDetailDtoFromJson(json);
}
