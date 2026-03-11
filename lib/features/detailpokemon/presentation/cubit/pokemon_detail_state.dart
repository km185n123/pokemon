import 'package:equatable/equatable.dart';
import 'package:pokemon/features/detailpokemon/domain/entities/pokemon_detail.dart';

abstract class PokemonDetailState extends Equatable {
  const PokemonDetailState();

  @override
  List<Object?> get props => [];
}

class PokemonDetailInitial extends PokemonDetailState {}

class PokemonDetailLoading extends PokemonDetailState {}

class PokemonDetailLoaded extends PokemonDetailState {
  final PokemonDetail pokemonDetail;

  const PokemonDetailLoaded(this.pokemonDetail);

  @override
  List<Object?> get props => [pokemonDetail];
}

class PokemonDetailError extends PokemonDetailState {
  final String message;

  const PokemonDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
