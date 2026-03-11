import 'package:equatable/equatable.dart';
import 'package:pokemon/features/landing/domain/entities/pokemon.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

class FavoritesStarted extends FavoritesEvent {}

class FavoritesDeleted extends FavoritesEvent {
  final Pokemon pokemon;

  const FavoritesDeleted(this.pokemon);

  @override
  List<Object?> get props => [pokemon];
}
