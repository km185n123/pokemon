// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TypeDto {

 TypeInfoDto get type;
/// Create a copy of TypeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypeDtoCopyWith<TypeDto> get copyWith => _$TypeDtoCopyWithImpl<TypeDto>(this as TypeDto, _$identity);

  /// Serializes this TypeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeDto&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'TypeDto(type: $type)';
}


}

/// @nodoc
abstract mixin class $TypeDtoCopyWith<$Res>  {
  factory $TypeDtoCopyWith(TypeDto value, $Res Function(TypeDto) _then) = _$TypeDtoCopyWithImpl;
@useResult
$Res call({
 TypeInfoDto type
});


$TypeInfoDtoCopyWith<$Res> get type;

}
/// @nodoc
class _$TypeDtoCopyWithImpl<$Res>
    implements $TypeDtoCopyWith<$Res> {
  _$TypeDtoCopyWithImpl(this._self, this._then);

  final TypeDto _self;
  final $Res Function(TypeDto) _then;

/// Create a copy of TypeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TypeInfoDto,
  ));
}
/// Create a copy of TypeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TypeInfoDtoCopyWith<$Res> get type {
  
  return $TypeInfoDtoCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [TypeDto].
extension TypeDtoPatterns on TypeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TypeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TypeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TypeDto value)  $default,){
final _that = this;
switch (_that) {
case _TypeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TypeDto value)?  $default,){
final _that = this;
switch (_that) {
case _TypeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TypeInfoDto type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TypeDto() when $default != null:
return $default(_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TypeInfoDto type)  $default,) {final _that = this;
switch (_that) {
case _TypeDto():
return $default(_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TypeInfoDto type)?  $default,) {final _that = this;
switch (_that) {
case _TypeDto() when $default != null:
return $default(_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TypeDto implements TypeDto {
  const _TypeDto({required this.type});
  factory _TypeDto.fromJson(Map<String, dynamic> json) => _$TypeDtoFromJson(json);

@override final  TypeInfoDto type;

/// Create a copy of TypeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TypeDtoCopyWith<_TypeDto> get copyWith => __$TypeDtoCopyWithImpl<_TypeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TypeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TypeDto&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'TypeDto(type: $type)';
}


}

/// @nodoc
abstract mixin class _$TypeDtoCopyWith<$Res> implements $TypeDtoCopyWith<$Res> {
  factory _$TypeDtoCopyWith(_TypeDto value, $Res Function(_TypeDto) _then) = __$TypeDtoCopyWithImpl;
@override @useResult
$Res call({
 TypeInfoDto type
});


@override $TypeInfoDtoCopyWith<$Res> get type;

}
/// @nodoc
class __$TypeDtoCopyWithImpl<$Res>
    implements _$TypeDtoCopyWith<$Res> {
  __$TypeDtoCopyWithImpl(this._self, this._then);

  final _TypeDto _self;
  final $Res Function(_TypeDto) _then;

/// Create a copy of TypeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(_TypeDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TypeInfoDto,
  ));
}

/// Create a copy of TypeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TypeInfoDtoCopyWith<$Res> get type {
  
  return $TypeInfoDtoCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}

// dart format on
