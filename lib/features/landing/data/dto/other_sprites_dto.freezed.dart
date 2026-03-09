// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_sprites_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtherSpritesDto {

@JsonKey(name: "official-artwork") OfficialArtworkDto? get officialArtwork;
/// Create a copy of OtherSpritesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtherSpritesDtoCopyWith<OtherSpritesDto> get copyWith => _$OtherSpritesDtoCopyWithImpl<OtherSpritesDto>(this as OtherSpritesDto, _$identity);

  /// Serializes this OtherSpritesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtherSpritesDto&&(identical(other.officialArtwork, officialArtwork) || other.officialArtwork == officialArtwork));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,officialArtwork);

@override
String toString() {
  return 'OtherSpritesDto(officialArtwork: $officialArtwork)';
}


}

/// @nodoc
abstract mixin class $OtherSpritesDtoCopyWith<$Res>  {
  factory $OtherSpritesDtoCopyWith(OtherSpritesDto value, $Res Function(OtherSpritesDto) _then) = _$OtherSpritesDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "official-artwork") OfficialArtworkDto? officialArtwork
});


$OfficialArtworkDtoCopyWith<$Res>? get officialArtwork;

}
/// @nodoc
class _$OtherSpritesDtoCopyWithImpl<$Res>
    implements $OtherSpritesDtoCopyWith<$Res> {
  _$OtherSpritesDtoCopyWithImpl(this._self, this._then);

  final OtherSpritesDto _self;
  final $Res Function(OtherSpritesDto) _then;

/// Create a copy of OtherSpritesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? officialArtwork = freezed,}) {
  return _then(_self.copyWith(
officialArtwork: freezed == officialArtwork ? _self.officialArtwork : officialArtwork // ignore: cast_nullable_to_non_nullable
as OfficialArtworkDto?,
  ));
}
/// Create a copy of OtherSpritesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfficialArtworkDtoCopyWith<$Res>? get officialArtwork {
    if (_self.officialArtwork == null) {
    return null;
  }

  return $OfficialArtworkDtoCopyWith<$Res>(_self.officialArtwork!, (value) {
    return _then(_self.copyWith(officialArtwork: value));
  });
}
}


/// Adds pattern-matching-related methods to [OtherSpritesDto].
extension OtherSpritesDtoPatterns on OtherSpritesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtherSpritesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtherSpritesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtherSpritesDto value)  $default,){
final _that = this;
switch (_that) {
case _OtherSpritesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtherSpritesDto value)?  $default,){
final _that = this;
switch (_that) {
case _OtherSpritesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "official-artwork")  OfficialArtworkDto? officialArtwork)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtherSpritesDto() when $default != null:
return $default(_that.officialArtwork);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "official-artwork")  OfficialArtworkDto? officialArtwork)  $default,) {final _that = this;
switch (_that) {
case _OtherSpritesDto():
return $default(_that.officialArtwork);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "official-artwork")  OfficialArtworkDto? officialArtwork)?  $default,) {final _that = this;
switch (_that) {
case _OtherSpritesDto() when $default != null:
return $default(_that.officialArtwork);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtherSpritesDto implements OtherSpritesDto {
  const _OtherSpritesDto({@JsonKey(name: "official-artwork") this.officialArtwork});
  factory _OtherSpritesDto.fromJson(Map<String, dynamic> json) => _$OtherSpritesDtoFromJson(json);

@override@JsonKey(name: "official-artwork") final  OfficialArtworkDto? officialArtwork;

/// Create a copy of OtherSpritesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtherSpritesDtoCopyWith<_OtherSpritesDto> get copyWith => __$OtherSpritesDtoCopyWithImpl<_OtherSpritesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtherSpritesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtherSpritesDto&&(identical(other.officialArtwork, officialArtwork) || other.officialArtwork == officialArtwork));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,officialArtwork);

@override
String toString() {
  return 'OtherSpritesDto(officialArtwork: $officialArtwork)';
}


}

/// @nodoc
abstract mixin class _$OtherSpritesDtoCopyWith<$Res> implements $OtherSpritesDtoCopyWith<$Res> {
  factory _$OtherSpritesDtoCopyWith(_OtherSpritesDto value, $Res Function(_OtherSpritesDto) _then) = __$OtherSpritesDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "official-artwork") OfficialArtworkDto? officialArtwork
});


@override $OfficialArtworkDtoCopyWith<$Res>? get officialArtwork;

}
/// @nodoc
class __$OtherSpritesDtoCopyWithImpl<$Res>
    implements _$OtherSpritesDtoCopyWith<$Res> {
  __$OtherSpritesDtoCopyWithImpl(this._self, this._then);

  final _OtherSpritesDto _self;
  final $Res Function(_OtherSpritesDto) _then;

/// Create a copy of OtherSpritesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? officialArtwork = freezed,}) {
  return _then(_OtherSpritesDto(
officialArtwork: freezed == officialArtwork ? _self.officialArtwork : officialArtwork // ignore: cast_nullable_to_non_nullable
as OfficialArtworkDto?,
  ));
}

/// Create a copy of OtherSpritesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfficialArtworkDtoCopyWith<$Res>? get officialArtwork {
    if (_self.officialArtwork == null) {
    return null;
  }

  return $OfficialArtworkDtoCopyWith<$Res>(_self.officialArtwork!, (value) {
    return _then(_self.copyWith(officialArtwork: value));
  });
}
}

// dart format on
