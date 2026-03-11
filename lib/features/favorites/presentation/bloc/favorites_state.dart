import 'package:equatable/equatable.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object?> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<Pokemon> pokemons;

  const FavoritesLoaded(this.pokemons);

  @override
  List<Object?> get props => [pokemons];
}

class FavoritesEmpty extends FavoritesState {}

class FavoritesError extends FavoritesState {
  final Failure failure;

  const FavoritesError(this.failure);

  @override
  List<Object?> get props => [failure];
}
