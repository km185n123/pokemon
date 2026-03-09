import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_info_dto.freezed.dart';
part 'type_info_dto.g.dart';

@freezed
abstract class TypeInfoDto with _$TypeInfoDto {
  const factory TypeInfoDto({required String name, String? url}) = _TypeInfoDto;

  factory TypeInfoDto.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoDtoFromJson(json);
}
