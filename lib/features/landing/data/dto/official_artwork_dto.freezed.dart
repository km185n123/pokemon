// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'official_artwork_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfficialArtworkDto {

@JsonKey(name: "front_default") String? get frontDefault;
/// Create a copy of OfficialArtworkDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfficialArtworkDtoCopyWith<OfficialArtworkDto> get copyWith => _$OfficialArtworkDtoCopyWithImpl<OfficialArtworkDto>(this as OfficialArtworkDto, _$identity);

  /// Serializes this OfficialArtworkDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficialArtworkDto&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frontDefault);

@override
String toString() {
  return 'OfficialArtworkDto(frontDefault: $frontDefault)';
}


}

/// @nodoc
abstract mixin class $OfficialArtworkDtoCopyWith<$Res>  {
  factory $OfficialArtworkDtoCopyWith(OfficialArtworkDto value, $Res Function(OfficialArtworkDto) _then) = _$OfficialArtworkDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "front_default") String? frontDefault
});




}
/// @nodoc
class _$OfficialArtworkDtoCopyWithImpl<$Res>
    implements $OfficialArtworkDtoCopyWith<$Res> {
  _$OfficialArtworkDtoCopyWithImpl(this._self, this._then);

  final OfficialArtworkDto _self;
  final $Res Function(OfficialArtworkDto) _then;

/// Create a copy of OfficialArtworkDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frontDefault = freezed,}) {
  return _then(_self.copyWith(
frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OfficialArtworkDto].
extension OfficialArtworkDtoPatterns on OfficialArtworkDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfficialArtworkDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfficialArtworkDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfficialArtworkDto value)  $default,){
final _that = this;
switch (_that) {
case _OfficialArtworkDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfficialArtworkDto value)?  $default,){
final _that = this;
switch (_that) {
case _OfficialArtworkDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "front_default")  String? frontDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfficialArtworkDto() when $default != null:
return $default(_that.frontDefault);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "front_default")  String? frontDefault)  $default,) {final _that = this;
switch (_that) {
case _OfficialArtworkDto():
return $default(_that.frontDefault);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "front_default")  String? frontDefault)?  $default,) {final _that = this;
switch (_that) {
case _OfficialArtworkDto() when $default != null:
return $default(_that.frontDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfficialArtworkDto implements OfficialArtworkDto {
  const _OfficialArtworkDto({@JsonKey(name: "front_default") this.frontDefault});
  factory _OfficialArtworkDto.fromJson(Map<String, dynamic> json) => _$OfficialArtworkDtoFromJson(json);

@override@JsonKey(name: "front_default") final  String? frontDefault;

/// Create a copy of OfficialArtworkDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfficialArtworkDtoCopyWith<_OfficialArtworkDto> get copyWith => __$OfficialArtworkDtoCopyWithImpl<_OfficialArtworkDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfficialArtworkDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfficialArtworkDto&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frontDefault);

@override
String toString() {
  return 'OfficialArtworkDto(frontDefault: $frontDefault)';
}


}

/// @nodoc
abstract mixin class _$OfficialArtworkDtoCopyWith<$Res> implements $OfficialArtworkDtoCopyWith<$Res> {
  factory _$OfficialArtworkDtoCopyWith(_OfficialArtworkDto value, $Res Function(_OfficialArtworkDto) _then) = __$OfficialArtworkDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "front_default") String? frontDefault
});




}
/// @nodoc
class __$OfficialArtworkDtoCopyWithImpl<$Res>
    implements _$OfficialArtworkDtoCopyWith<$Res> {
  __$OfficialArtworkDtoCopyWithImpl(this._self, this._then);

  final _OfficialArtworkDto _self;
  final $Res Function(_OfficialArtworkDto) _then;

/// Create a copy of OfficialArtworkDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frontDefault = freezed,}) {
  return _then(_OfficialArtworkDto(
frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
