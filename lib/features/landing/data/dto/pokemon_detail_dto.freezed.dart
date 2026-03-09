// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonDetailDto {

 int get id; String get name; int get height; int get weight; List<TypeDto> get types; SpritesDto get sprites;
/// Create a copy of PokemonDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonDetailDtoCopyWith<PokemonDetailDto> get copyWith => _$PokemonDetailDtoCopyWithImpl<PokemonDetailDto>(this as PokemonDetailDto, _$identity);

  /// Serializes this PokemonDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&const DeepCollectionEquality().equals(other.types, types)&&(identical(other.sprites, sprites) || other.sprites == sprites));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,height,weight,const DeepCollectionEquality().hash(types),sprites);

@override
String toString() {
  return 'PokemonDetailDto(id: $id, name: $name, height: $height, weight: $weight, types: $types, sprites: $sprites)';
}


}

/// @nodoc
abstract mixin class $PokemonDetailDtoCopyWith<$Res>  {
  factory $PokemonDetailDtoCopyWith(PokemonDetailDto value, $Res Function(PokemonDetailDto) _then) = _$PokemonDetailDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, int height, int weight, List<TypeDto> types, SpritesDto sprites
});


$SpritesDtoCopyWith<$Res> get sprites;

}
/// @nodoc
class _$PokemonDetailDtoCopyWithImpl<$Res>
    implements $PokemonDetailDtoCopyWith<$Res> {
  _$PokemonDetailDtoCopyWithImpl(this._self, this._then);

  final PokemonDetailDto _self;
  final $Res Function(PokemonDetailDto) _then;

/// Create a copy of PokemonDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? height = null,Object? weight = null,Object? types = null,Object? sprites = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<TypeDto>,sprites: null == sprites ? _self.sprites : sprites // ignore: cast_nullable_to_non_nullable
as SpritesDto,
  ));
}
/// Create a copy of PokemonDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpritesDtoCopyWith<$Res> get sprites {
  
  return $SpritesDtoCopyWith<$Res>(_self.sprites, (value) {
    return _then(_self.copyWith(sprites: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonDetailDto].
extension PokemonDetailDtoPatterns on PokemonDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _PokemonDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int height,  int weight,  List<TypeDto> types,  SpritesDto sprites)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.height,_that.weight,_that.types,_that.sprites);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int height,  int weight,  List<TypeDto> types,  SpritesDto sprites)  $default,) {final _that = this;
switch (_that) {
case _PokemonDetailDto():
return $default(_that.id,_that.name,_that.height,_that.weight,_that.types,_that.sprites);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int height,  int weight,  List<TypeDto> types,  SpritesDto sprites)?  $default,) {final _that = this;
switch (_that) {
case _PokemonDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.height,_that.weight,_that.types,_that.sprites);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonDetailDto implements PokemonDetailDto {
  const _PokemonDetailDto({required this.id, required this.name, required this.height, required this.weight, required final  List<TypeDto> types, required this.sprites}): _types = types;
  factory _PokemonDetailDto.fromJson(Map<String, dynamic> json) => _$PokemonDetailDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  int height;
@override final  int weight;
 final  List<TypeDto> _types;
@override List<TypeDto> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

@override final  SpritesDto sprites;

/// Create a copy of PokemonDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonDetailDtoCopyWith<_PokemonDetailDto> get copyWith => __$PokemonDetailDtoCopyWithImpl<_PokemonDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&const DeepCollectionEquality().equals(other._types, _types)&&(identical(other.sprites, sprites) || other.sprites == sprites));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,height,weight,const DeepCollectionEquality().hash(_types),sprites);

@override
String toString() {
  return 'PokemonDetailDto(id: $id, name: $name, height: $height, weight: $weight, types: $types, sprites: $sprites)';
}


}

/// @nodoc
abstract mixin class _$PokemonDetailDtoCopyWith<$Res> implements $PokemonDetailDtoCopyWith<$Res> {
  factory _$PokemonDetailDtoCopyWith(_PokemonDetailDto value, $Res Function(_PokemonDetailDto) _then) = __$PokemonDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int height, int weight, List<TypeDto> types, SpritesDto sprites
});


@override $SpritesDtoCopyWith<$Res> get sprites;

}
/// @nodoc
class __$PokemonDetailDtoCopyWithImpl<$Res>
    implements _$PokemonDetailDtoCopyWith<$Res> {
  __$PokemonDetailDtoCopyWithImpl(this._self, this._then);

  final _PokemonDetailDto _self;
  final $Res Function(_PokemonDetailDto) _then;

/// Create a copy of PokemonDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? height = null,Object? weight = null,Object? types = null,Object? sprites = null,}) {
  return _then(_PokemonDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<TypeDto>,sprites: null == sprites ? _self.sprites : sprites // ignore: cast_nullable_to_non_nullable
as SpritesDto,
  ));
}

/// Create a copy of PokemonDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpritesDtoCopyWith<$Res> get sprites {
  
  return $SpritesDtoCopyWith<$Res>(_self.sprites, (value) {
    return _then(_self.copyWith(sprites: value));
  });
}
}

// dart format on
