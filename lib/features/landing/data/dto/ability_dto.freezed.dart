// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ability_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AbilityDto {

 AbilityDetailDto get ability;
/// Create a copy of AbilityDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbilityDtoCopyWith<AbilityDto> get copyWith => _$AbilityDtoCopyWithImpl<AbilityDto>(this as AbilityDto, _$identity);

  /// Serializes this AbilityDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbilityDto&&(identical(other.ability, ability) || other.ability == ability));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ability);

@override
String toString() {
  return 'AbilityDto(ability: $ability)';
}


}

/// @nodoc
abstract mixin class $AbilityDtoCopyWith<$Res>  {
  factory $AbilityDtoCopyWith(AbilityDto value, $Res Function(AbilityDto) _then) = _$AbilityDtoCopyWithImpl;
@useResult
$Res call({
 AbilityDetailDto ability
});


$AbilityDetailDtoCopyWith<$Res> get ability;

}
/// @nodoc
class _$AbilityDtoCopyWithImpl<$Res>
    implements $AbilityDtoCopyWith<$Res> {
  _$AbilityDtoCopyWithImpl(this._self, this._then);

  final AbilityDto _self;
  final $Res Function(AbilityDto) _then;

/// Create a copy of AbilityDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ability = null,}) {
  return _then(_self.copyWith(
ability: null == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as AbilityDetailDto,
  ));
}
/// Create a copy of AbilityDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AbilityDetailDtoCopyWith<$Res> get ability {
  
  return $AbilityDetailDtoCopyWith<$Res>(_self.ability, (value) {
    return _then(_self.copyWith(ability: value));
  });
}
}


/// Adds pattern-matching-related methods to [AbilityDto].
extension AbilityDtoPatterns on AbilityDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AbilityDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AbilityDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AbilityDto value)  $default,){
final _that = this;
switch (_that) {
case _AbilityDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AbilityDto value)?  $default,){
final _that = this;
switch (_that) {
case _AbilityDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AbilityDetailDto ability)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AbilityDto() when $default != null:
return $default(_that.ability);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AbilityDetailDto ability)  $default,) {final _that = this;
switch (_that) {
case _AbilityDto():
return $default(_that.ability);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AbilityDetailDto ability)?  $default,) {final _that = this;
switch (_that) {
case _AbilityDto() when $default != null:
return $default(_that.ability);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AbilityDto implements AbilityDto {
  const _AbilityDto({required this.ability});
  factory _AbilityDto.fromJson(Map<String, dynamic> json) => _$AbilityDtoFromJson(json);

@override final  AbilityDetailDto ability;

/// Create a copy of AbilityDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbilityDtoCopyWith<_AbilityDto> get copyWith => __$AbilityDtoCopyWithImpl<_AbilityDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AbilityDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AbilityDto&&(identical(other.ability, ability) || other.ability == ability));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ability);

@override
String toString() {
  return 'AbilityDto(ability: $ability)';
}


}

/// @nodoc
abstract mixin class _$AbilityDtoCopyWith<$Res> implements $AbilityDtoCopyWith<$Res> {
  factory _$AbilityDtoCopyWith(_AbilityDto value, $Res Function(_AbilityDto) _then) = __$AbilityDtoCopyWithImpl;
@override @useResult
$Res call({
 AbilityDetailDto ability
});


@override $AbilityDetailDtoCopyWith<$Res> get ability;

}
/// @nodoc
class __$AbilityDtoCopyWithImpl<$Res>
    implements _$AbilityDtoCopyWith<$Res> {
  __$AbilityDtoCopyWithImpl(this._self, this._then);

  final _AbilityDto _self;
  final $Res Function(_AbilityDto) _then;

/// Create a copy of AbilityDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ability = null,}) {
  return _then(_AbilityDto(
ability: null == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as AbilityDetailDto,
  ));
}

/// Create a copy of AbilityDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AbilityDetailDtoCopyWith<$Res> get ability {
  
  return $AbilityDetailDtoCopyWith<$Res>(_self.ability, (value) {
    return _then(_self.copyWith(ability: value));
  });
}
}

// dart format on
