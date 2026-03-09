import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';
import 'package:equatable/equatable.dart';

abstract class PokemonsState extends Equatable {
  const PokemonsState();

  @override
  List<Object> get props => [];
}

class PokemonsInitial extends PokemonsState {}

class PokemonsLoading extends PokemonsState {}

class PokemonsLoaded extends PokemonsState {
  final List<Pokemon> pokemons;
  final bool hasReachedMax;
  final bool isLoadingMore;

  const PokemonsLoaded(
    this.pokemons, {
    this.hasReachedMax = false,
    this.isLoadingMore = false,
  });

  PokemonsLoaded copyWith({
    List<Pokemon>? pokemons,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return PokemonsLoaded(
      pokemons ?? this.pokemons,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object> get props => [pokemons, hasReachedMax, isLoadingMore];
}

class PokemonsError extends PokemonsState {
  final Failure failure;

  const PokemonsError(this.failure);

  @override
  List<Object> get props => [failure];
}
