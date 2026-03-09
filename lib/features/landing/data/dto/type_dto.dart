import 'package:freezed_annotation/freezed_annotation.dart';
import 'type_info_dto.dart';

part 'type_dto.freezed.dart';
part 'type_dto.g.dart';

@freezed
abstract class TypeDto with _$TypeDto {
  const factory TypeDto({required TypeInfoDto type}) = _TypeDto;

  factory TypeDto.fromJson(Map<String, dynamic> json) =>
      _$TypeDtoFromJson(json);
}
