// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TypeInfoDto {

 String get name; String? get url;
/// Create a copy of TypeInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypeInfoDtoCopyWith<TypeInfoDto> get copyWith => _$TypeInfoDtoCopyWithImpl<TypeInfoDto>(this as TypeInfoDto, _$identity);

  /// Serializes this TypeInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeInfoDto&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'TypeInfoDto(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $TypeInfoDtoCopyWith<$Res>  {
  factory $TypeInfoDtoCopyWith(TypeInfoDto value, $Res Function(TypeInfoDto) _then) = _$TypeInfoDtoCopyWithImpl;
@useResult
$Res call({
 String name, String? url
});




}
/// @nodoc
class _$TypeInfoDtoCopyWithImpl<$Res>
    implements $TypeInfoDtoCopyWith<$Res> {
  _$TypeInfoDtoCopyWithImpl(this._self, this._then);

  final TypeInfoDto _self;
  final $Res Function(TypeInfoDto) _then;

/// Create a copy of TypeInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TypeInfoDto].
extension TypeInfoDtoPatterns on TypeInfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TypeInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TypeInfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TypeInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _TypeInfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TypeInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _TypeInfoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TypeInfoDto() when $default != null:
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? url)  $default,) {final _that = this;
switch (_that) {
case _TypeInfoDto():
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _TypeInfoDto() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TypeInfoDto implements TypeInfoDto {
  const _TypeInfoDto({required this.name, this.url});
  factory _TypeInfoDto.fromJson(Map<String, dynamic> json) => _$TypeInfoDtoFromJson(json);

@override final  String name;
@override final  String? url;

/// Create a copy of TypeInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TypeInfoDtoCopyWith<_TypeInfoDto> get copyWith => __$TypeInfoDtoCopyWithImpl<_TypeInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TypeInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TypeInfoDto&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'TypeInfoDto(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$TypeInfoDtoCopyWith<$Res> implements $TypeInfoDtoCopyWith<$Res> {
  factory _$TypeInfoDtoCopyWith(_TypeInfoDto value, $Res Function(_TypeInfoDto) _then) = __$TypeInfoDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String? url
});




}
/// @nodoc
class __$TypeInfoDtoCopyWithImpl<$Res>
    implements _$TypeInfoDtoCopyWith<$Res> {
  __$TypeInfoDtoCopyWithImpl(this._self, this._then);

  final _TypeInfoDto _self;
  final $Res Function(_TypeInfoDto) _then;

/// Create a copy of TypeInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = freezed,}) {
  return _then(_TypeInfoDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
