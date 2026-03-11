// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_species_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonSpeciesDto {

@JsonKey(name: 'flavor_text_entries') List<FlavorTextDto> get flavorTextEntries; List<GenusDto> get genera;@JsonKey(name: 'gender_rate') int get genderRate;
/// Create a copy of PokemonSpeciesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonSpeciesDtoCopyWith<PokemonSpeciesDto> get copyWith => _$PokemonSpeciesDtoCopyWithImpl<PokemonSpeciesDto>(this as PokemonSpeciesDto, _$identity);

  /// Serializes this PokemonSpeciesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonSpeciesDto&&const DeepCollectionEquality().equals(other.flavorTextEntries, flavorTextEntries)&&const DeepCollectionEquality().equals(other.genera, genera)&&(identical(other.genderRate, genderRate) || other.genderRate == genderRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(flavorTextEntries),const DeepCollectionEquality().hash(genera),genderRate);

@override
String toString() {
  return 'PokemonSpeciesDto(flavorTextEntries: $flavorTextEntries, genera: $genera, genderRate: $genderRate)';
}


}

/// @nodoc
abstract mixin class $PokemonSpeciesDtoCopyWith<$Res>  {
  factory $PokemonSpeciesDtoCopyWith(PokemonSpeciesDto value, $Res Function(PokemonSpeciesDto) _then) = _$PokemonSpeciesDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'flavor_text_entries') List<FlavorTextDto> flavorTextEntries, List<GenusDto> genera,@JsonKey(name: 'gender_rate') int genderRate
});




}
/// @nodoc
class _$PokemonSpeciesDtoCopyWithImpl<$Res>
    implements $PokemonSpeciesDtoCopyWith<$Res> {
  _$PokemonSpeciesDtoCopyWithImpl(this._self, this._then);

  final PokemonSpeciesDto _self;
  final $Res Function(PokemonSpeciesDto) _then;

/// Create a copy of PokemonSpeciesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flavorTextEntries = null,Object? genera = null,Object? genderRate = null,}) {
  return _then(_self.copyWith(
flavorTextEntries: null == flavorTextEntries ? _self.flavorTextEntries : flavorTextEntries // ignore: cast_nullable_to_non_nullable
as List<FlavorTextDto>,genera: null == genera ? _self.genera : genera // ignore: cast_nullable_to_non_nullable
as List<GenusDto>,genderRate: null == genderRate ? _self.genderRate : genderRate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonSpeciesDto].
extension PokemonSpeciesDtoPatterns on PokemonSpeciesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonSpeciesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonSpeciesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonSpeciesDto value)  $default,){
final _that = this;
switch (_that) {
case _PokemonSpeciesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonSpeciesDto value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonSpeciesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'flavor_text_entries')  List<FlavorTextDto> flavorTextEntries,  List<GenusDto> genera, @JsonKey(name: 'gender_rate')  int genderRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonSpeciesDto() when $default != null:
return $default(_that.flavorTextEntries,_that.genera,_that.genderRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'flavor_text_entries')  List<FlavorTextDto> flavorTextEntries,  List<GenusDto> genera, @JsonKey(name: 'gender_rate')  int genderRate)  $default,) {final _that = this;
switch (_that) {
case _PokemonSpeciesDto():
return $default(_that.flavorTextEntries,_that.genera,_that.genderRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'flavor_text_entries')  List<FlavorTextDto> flavorTextEntries,  List<GenusDto> genera, @JsonKey(name: 'gender_rate')  int genderRate)?  $default,) {final _that = this;
switch (_that) {
case _PokemonSpeciesDto() when $default != null:
return $default(_that.flavorTextEntries,_that.genera,_that.genderRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonSpeciesDto implements PokemonSpeciesDto {
  const _PokemonSpeciesDto({@JsonKey(name: 'flavor_text_entries') required final  List<FlavorTextDto> flavorTextEntries, required final  List<GenusDto> genera, @JsonKey(name: 'gender_rate') required this.genderRate}): _flavorTextEntries = flavorTextEntries,_genera = genera;
  factory _PokemonSpeciesDto.fromJson(Map<String, dynamic> json) => _$PokemonSpeciesDtoFromJson(json);

 final  List<FlavorTextDto> _flavorTextEntries;
@override@JsonKey(name: 'flavor_text_entries') List<FlavorTextDto> get flavorTextEntries {
  if (_flavorTextEntries is EqualUnmodifiableListView) return _flavorTextEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flavorTextEntries);
}

 final  List<GenusDto> _genera;
@override List<GenusDto> get genera {
  if (_genera is EqualUnmodifiableListView) return _genera;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genera);
}

@override@JsonKey(name: 'gender_rate') final  int genderRate;

/// Create a copy of PokemonSpeciesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonSpeciesDtoCopyWith<_PokemonSpeciesDto> get copyWith => __$PokemonSpeciesDtoCopyWithImpl<_PokemonSpeciesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonSpeciesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonSpeciesDto&&const DeepCollectionEquality().equals(other._flavorTextEntries, _flavorTextEntries)&&const DeepCollectionEquality().equals(other._genera, _genera)&&(identical(other.genderRate, genderRate) || other.genderRate == genderRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_flavorTextEntries),const DeepCollectionEquality().hash(_genera),genderRate);

@override
String toString() {
  return 'PokemonSpeciesDto(flavorTextEntries: $flavorTextEntries, genera: $genera, genderRate: $genderRate)';
}


}

/// @nodoc
abstract mixin class _$PokemonSpeciesDtoCopyWith<$Res> implements $PokemonSpeciesDtoCopyWith<$Res> {
  factory _$PokemonSpeciesDtoCopyWith(_PokemonSpeciesDto value, $Res Function(_PokemonSpeciesDto) _then) = __$PokemonSpeciesDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'flavor_text_entries') List<FlavorTextDto> flavorTextEntries, List<GenusDto> genera,@JsonKey(name: 'gender_rate') int genderRate
});




}
/// @nodoc
class __$PokemonSpeciesDtoCopyWithImpl<$Res>
    implements _$PokemonSpeciesDtoCopyWith<$Res> {
  __$PokemonSpeciesDtoCopyWithImpl(this._self, this._then);

  final _PokemonSpeciesDto _self;
  final $Res Function(_PokemonSpeciesDto) _then;

/// Create a copy of PokemonSpeciesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flavorTextEntries = null,Object? genera = null,Object? genderRate = null,}) {
  return _then(_PokemonSpeciesDto(
flavorTextEntries: null == flavorTextEntries ? _self._flavorTextEntries : flavorTextEntries // ignore: cast_nullable_to_non_nullable
as List<FlavorTextDto>,genera: null == genera ? _self._genera : genera // ignore: cast_nullable_to_non_nullable
as List<GenusDto>,genderRate: null == genderRate ? _self.genderRate : genderRate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
