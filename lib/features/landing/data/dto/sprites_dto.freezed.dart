// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sprites_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpritesDto {

@JsonKey(name: "front_default") String? get frontDefault; OtherSpritesDto? get other;
/// Create a copy of SpritesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpritesDtoCopyWith<SpritesDto> get copyWith => _$SpritesDtoCopyWithImpl<SpritesDto>(this as SpritesDto, _$identity);

  /// Serializes this SpritesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpritesDto&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frontDefault,other);

@override
String toString() {
  return 'SpritesDto(frontDefault: $frontDefault, other: $other)';
}


}

/// @nodoc
abstract mixin class $SpritesDtoCopyWith<$Res>  {
  factory $SpritesDtoCopyWith(SpritesDto value, $Res Function(SpritesDto) _then) = _$SpritesDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "front_default") String? frontDefault, OtherSpritesDto? other
});


$OtherSpritesDtoCopyWith<$Res>? get other;

}
/// @nodoc
class _$SpritesDtoCopyWithImpl<$Res>
    implements $SpritesDtoCopyWith<$Res> {
  _$SpritesDtoCopyWithImpl(this._self, this._then);

  final SpritesDto _self;
  final $Res Function(SpritesDto) _then;

/// Create a copy of SpritesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frontDefault = freezed,Object? other = freezed,}) {
  return _then(_self.copyWith(
frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,other: freezed == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as OtherSpritesDto?,
  ));
}
/// Create a copy of SpritesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OtherSpritesDtoCopyWith<$Res>? get other {
    if (_self.other == null) {
    return null;
  }

  return $OtherSpritesDtoCopyWith<$Res>(_self.other!, (value) {
    return _then(_self.copyWith(other: value));
  });
}
}


/// Adds pattern-matching-related methods to [SpritesDto].
extension SpritesDtoPatterns on SpritesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpritesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpritesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpritesDto value)  $default,){
final _that = this;
switch (_that) {
case _SpritesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpritesDto value)?  $default,){
final _that = this;
switch (_that) {
case _SpritesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "front_default")  String? frontDefault,  OtherSpritesDto? other)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpritesDto() when $default != null:
return $default(_that.frontDefault,_that.other);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "front_default")  String? frontDefault,  OtherSpritesDto? other)  $default,) {final _that = this;
switch (_that) {
case _SpritesDto():
return $default(_that.frontDefault,_that.other);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "front_default")  String? frontDefault,  OtherSpritesDto? other)?  $default,) {final _that = this;
switch (_that) {
case _SpritesDto() when $default != null:
return $default(_that.frontDefault,_that.other);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpritesDto implements SpritesDto {
  const _SpritesDto({@JsonKey(name: "front_default") this.frontDefault, this.other});
  factory _SpritesDto.fromJson(Map<String, dynamic> json) => _$SpritesDtoFromJson(json);

@override@JsonKey(name: "front_default") final  String? frontDefault;
@override final  OtherSpritesDto? other;

/// Create a copy of SpritesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpritesDtoCopyWith<_SpritesDto> get copyWith => __$SpritesDtoCopyWithImpl<_SpritesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpritesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpritesDto&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frontDefault,other);

@override
String toString() {
  return 'SpritesDto(frontDefault: $frontDefault, other: $other)';
}


}

/// @nodoc
abstract mixin class _$SpritesDtoCopyWith<$Res> implements $SpritesDtoCopyWith<$Res> {
  factory _$SpritesDtoCopyWith(_SpritesDto value, $Res Function(_SpritesDto) _then) = __$SpritesDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "front_default") String? frontDefault, OtherSpritesDto? other
});


@override $OtherSpritesDtoCopyWith<$Res>? get other;

}
/// @nodoc
class __$SpritesDtoCopyWithImpl<$Res>
    implements _$SpritesDtoCopyWith<$Res> {
  __$SpritesDtoCopyWithImpl(this._self, this._then);

  final _SpritesDto _self;
  final $Res Function(_SpritesDto) _then;

/// Create a copy of SpritesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frontDefault = freezed,Object? other = freezed,}) {
  return _then(_SpritesDto(
frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,other: freezed == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as OtherSpritesDto?,
  ));
}

/// Create a copy of SpritesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OtherSpritesDtoCopyWith<$Res>? get other {
    if (_self.other == null) {
    return null;
  }

  return $OtherSpritesDtoCopyWith<$Res>(_self.other!, (value) {
    return _then(_self.copyWith(other: value));
  });
}
}

// dart format on
