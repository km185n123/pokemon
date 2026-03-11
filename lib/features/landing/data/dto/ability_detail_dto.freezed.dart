// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ability_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AbilityDetailDto {

 String get name; String get url;
/// Create a copy of AbilityDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbilityDetailDtoCopyWith<AbilityDetailDto> get copyWith => _$AbilityDetailDtoCopyWithImpl<AbilityDetailDto>(this as AbilityDetailDto, _$identity);

  /// Serializes this AbilityDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbilityDetailDto&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'AbilityDetailDto(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $AbilityDetailDtoCopyWith<$Res>  {
  factory $AbilityDetailDtoCopyWith(AbilityDetailDto value, $Res Function(AbilityDetailDto) _then) = _$AbilityDetailDtoCopyWithImpl;
@useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class _$AbilityDetailDtoCopyWithImpl<$Res>
    implements $AbilityDetailDtoCopyWith<$Res> {
  _$AbilityDetailDtoCopyWithImpl(this._self, this._then);

  final AbilityDetailDto _self;
  final $Res Function(AbilityDetailDto) _then;

/// Create a copy of AbilityDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AbilityDetailDto].
extension AbilityDetailDtoPatterns on AbilityDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AbilityDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AbilityDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AbilityDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _AbilityDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AbilityDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _AbilityDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AbilityDetailDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String url)  $default,) {final _that = this;
switch (_that) {
case _AbilityDetailDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String url)?  $default,) {final _that = this;
switch (_that) {
case _AbilityDetailDto() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AbilityDetailDto implements AbilityDetailDto {
  const _AbilityDetailDto({required this.name, required this.url});
  factory _AbilityDetailDto.fromJson(Map<String, dynamic> json) => _$AbilityDetailDtoFromJson(json);

@override final  String name;
@override final  String url;

/// Create a copy of AbilityDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbilityDetailDtoCopyWith<_AbilityDetailDto> get copyWith => __$AbilityDetailDtoCopyWithImpl<_AbilityDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AbilityDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AbilityDetailDto&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'AbilityDetailDto(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$AbilityDetailDtoCopyWith<$Res> implements $AbilityDetailDtoCopyWith<$Res> {
  factory _$AbilityDetailDtoCopyWith(_AbilityDetailDto value, $Res Function(_AbilityDetailDto) _then) = __$AbilityDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class __$AbilityDetailDtoCopyWithImpl<$Res>
    implements _$AbilityDetailDtoCopyWith<$Res> {
  __$AbilityDetailDtoCopyWithImpl(this._self, this._then);

  final _AbilityDetailDto _self;
  final $Res Function(_AbilityDetailDto) _then;

/// Create a copy of AbilityDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,}) {
  return _then(_AbilityDetailDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
