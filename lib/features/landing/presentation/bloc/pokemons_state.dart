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
  final List<String> selectedTypes;

  const PokemonsLoaded(
    this.pokemons, {
    this.hasReachedMax = false,
    this.isLoadingMore = false,
    this.selectedTypes = const [],
  });

  PokemonsLoaded copyWith({
    List<Pokemon>? pokemons,
    bool? hasReachedMax,
    bool? isLoadingMore,
    List<String>? selectedTypes,
  }) {
    return PokemonsLoaded(
      pokemons ?? this.pokemons,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      selectedTypes: selectedTypes ?? this.selectedTypes,
    );
  }

  @override
  List<Object> get props => [
    pokemons,
    hasReachedMax,
    isLoadingMore,
    selectedTypes,
  ];
}

class PokemonsError extends PokemonsState {
  final Failure failure;

  const PokemonsError(this.failure);

  @override
  List<Object> get props => [failure];
}
