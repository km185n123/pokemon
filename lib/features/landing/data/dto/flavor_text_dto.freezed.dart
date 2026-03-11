// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flavor_text_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlavorTextDto {

@JsonKey(name: 'flavor_text') String get flavorText; LanguageDto get language;
/// Create a copy of FlavorTextDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlavorTextDtoCopyWith<FlavorTextDto> get copyWith => _$FlavorTextDtoCopyWithImpl<FlavorTextDto>(this as FlavorTextDto, _$identity);

  /// Serializes this FlavorTextDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlavorTextDto&&(identical(other.flavorText, flavorText) || other.flavorText == flavorText)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flavorText,language);

@override
String toString() {
  return 'FlavorTextDto(flavorText: $flavorText, language: $language)';
}


}

/// @nodoc
abstract mixin class $FlavorTextDtoCopyWith<$Res>  {
  factory $FlavorTextDtoCopyWith(FlavorTextDto value, $Res Function(FlavorTextDto) _then) = _$FlavorTextDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'flavor_text') String flavorText, LanguageDto language
});


$LanguageDtoCopyWith<$Res> get language;

}
/// @nodoc
class _$FlavorTextDtoCopyWithImpl<$Res>
    implements $FlavorTextDtoCopyWith<$Res> {
  _$FlavorTextDtoCopyWithImpl(this._self, this._then);

  final FlavorTextDto _self;
  final $Res Function(FlavorTextDto) _then;

/// Create a copy of FlavorTextDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flavorText = null,Object? language = null,}) {
  return _then(_self.copyWith(
flavorText: null == flavorText ? _self.flavorText : flavorText // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as LanguageDto,
  ));
}
/// Create a copy of FlavorTextDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LanguageDtoCopyWith<$Res> get language {
  
  return $LanguageDtoCopyWith<$Res>(_self.language, (value) {
    return _then(_self.copyWith(language: value));
  });
}
}


/// Adds pattern-matching-related methods to [FlavorTextDto].
extension FlavorTextDtoPatterns on FlavorTextDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlavorTextDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlavorTextDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlavorTextDto value)  $default,){
final _that = this;
switch (_that) {
case _FlavorTextDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlavorTextDto value)?  $default,){
final _that = this;
switch (_that) {
case _FlavorTextDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'flavor_text')  String flavorText,  LanguageDto language)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlavorTextDto() when $default != null:
return $default(_that.flavorText,_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'flavor_text')  String flavorText,  LanguageDto language)  $default,) {final _that = this;
switch (_that) {
case _FlavorTextDto():
return $default(_that.flavorText,_that.language);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'flavor_text')  String flavorText,  LanguageDto language)?  $default,) {final _that = this;
switch (_that) {
case _FlavorTextDto() when $default != null:
return $default(_that.flavorText,_that.language);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlavorTextDto implements FlavorTextDto {
  const _FlavorTextDto({@JsonKey(name: 'flavor_text') required this.flavorText, required this.language});
  factory _FlavorTextDto.fromJson(Map<String, dynamic> json) => _$FlavorTextDtoFromJson(json);

@override@JsonKey(name: 'flavor_text') final  String flavorText;
@override final  LanguageDto language;

/// Create a copy of FlavorTextDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlavorTextDtoCopyWith<_FlavorTextDto> get copyWith => __$FlavorTextDtoCopyWithImpl<_FlavorTextDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlavorTextDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlavorTextDto&&(identical(other.flavorText, flavorText) || other.flavorText == flavorText)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flavorText,language);

@override
String toString() {
  return 'FlavorTextDto(flavorText: $flavorText, language: $language)';
}


}

/// @nodoc
abstract mixin class _$FlavorTextDtoCopyWith<$Res> implements $FlavorTextDtoCopyWith<$Res> {
  factory _$FlavorTextDtoCopyWith(_FlavorTextDto value, $Res Function(_FlavorTextDto) _then) = __$FlavorTextDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'flavor_text') String flavorText, LanguageDto language
});


@override $LanguageDtoCopyWith<$Res> get language;

}
/// @nodoc
class __$FlavorTextDtoCopyWithImpl<$Res>
    implements _$FlavorTextDtoCopyWith<$Res> {
  __$FlavorTextDtoCopyWithImpl(this._self, this._then);

  final _FlavorTextDto _self;
  final $Res Function(_FlavorTextDto) _then;

/// Create a copy of FlavorTextDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flavorText = null,Object? language = null,}) {
  return _then(_FlavorTextDto(
flavorText: null == flavorText ? _self.flavorText : flavorText // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as LanguageDto,
  ));
}

/// Create a copy of FlavorTextDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LanguageDtoCopyWith<$Res> get language {
  
  return $LanguageDtoCopyWith<$Res>(_self.language, (value) {
    return _then(_self.copyWith(language: value));
  });
}
}

// dart format on
