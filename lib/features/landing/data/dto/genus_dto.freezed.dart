// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genus_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenusDto {

 String get genus; LanguageDto get language;
/// Create a copy of GenusDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenusDtoCopyWith<GenusDto> get copyWith => _$GenusDtoCopyWithImpl<GenusDto>(this as GenusDto, _$identity);

  /// Serializes this GenusDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenusDto&&(identical(other.genus, genus) || other.genus == genus)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genus,language);

@override
String toString() {
  return 'GenusDto(genus: $genus, language: $language)';
}


}

/// @nodoc
abstract mixin class $GenusDtoCopyWith<$Res>  {
  factory $GenusDtoCopyWith(GenusDto value, $Res Function(GenusDto) _then) = _$GenusDtoCopyWithImpl;
@useResult
$Res call({
 String genus, LanguageDto language
});


$LanguageDtoCopyWith<$Res> get language;

}
/// @nodoc
class _$GenusDtoCopyWithImpl<$Res>
    implements $GenusDtoCopyWith<$Res> {
  _$GenusDtoCopyWithImpl(this._self, this._then);

  final GenusDto _self;
  final $Res Function(GenusDto) _then;

/// Create a copy of GenusDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genus = null,Object? language = null,}) {
  return _then(_self.copyWith(
genus: null == genus ? _self.genus : genus // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as LanguageDto,
  ));
}
/// Create a copy of GenusDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LanguageDtoCopyWith<$Res> get language {
  
  return $LanguageDtoCopyWith<$Res>(_self.language, (value) {
    return _then(_self.copyWith(language: value));
  });
}
}


/// Adds pattern-matching-related methods to [GenusDto].
extension GenusDtoPatterns on GenusDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenusDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenusDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenusDto value)  $default,){
final _that = this;
switch (_that) {
case _GenusDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenusDto value)?  $default,){
final _that = this;
switch (_that) {
case _GenusDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String genus,  LanguageDto language)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenusDto() when $default != null:
return $default(_that.genus,_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String genus,  LanguageDto language)  $default,) {final _that = this;
switch (_that) {
case _GenusDto():
return $default(_that.genus,_that.language);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String genus,  LanguageDto language)?  $default,) {final _that = this;
switch (_that) {
case _GenusDto() when $default != null:
return $default(_that.genus,_that.language);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenusDto implements GenusDto {
  const _GenusDto({required this.genus, required this.language});
  factory _GenusDto.fromJson(Map<String, dynamic> json) => _$GenusDtoFromJson(json);

@override final  String genus;
@override final  LanguageDto language;

/// Create a copy of GenusDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenusDtoCopyWith<_GenusDto> get copyWith => __$GenusDtoCopyWithImpl<_GenusDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenusDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenusDto&&(identical(other.genus, genus) || other.genus == genus)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genus,language);

@override
String toString() {
  return 'GenusDto(genus: $genus, language: $language)';
}


}

/// @nodoc
abstract mixin class _$GenusDtoCopyWith<$Res> implements $GenusDtoCopyWith<$Res> {
  factory _$GenusDtoCopyWith(_GenusDto value, $Res Function(_GenusDto) _then) = __$GenusDtoCopyWithImpl;
@override @useResult
$Res call({
 String genus, LanguageDto language
});


@override $LanguageDtoCopyWith<$Res> get language;

}
/// @nodoc
class __$GenusDtoCopyWithImpl<$Res>
    implements _$GenusDtoCopyWith<$Res> {
  __$GenusDtoCopyWithImpl(this._self, this._then);

  final _GenusDto _self;
  final $Res Function(_GenusDto) _then;

/// Create a copy of GenusDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genus = null,Object? language = null,}) {
  return _then(_GenusDto(
genus: null == genus ? _self.genus : genus // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as LanguageDto,
  ));
}

/// Create a copy of GenusDto
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
