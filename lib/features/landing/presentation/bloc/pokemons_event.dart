import 'package:equatable/equatable.dart';

abstract class PokemonsEvent extends Equatable {
  const PokemonsEvent();

  @override
  List<Object> get props => [];
}

class PokemonsStarted extends PokemonsEvent {}

class PokemonsLoadMore extends PokemonsEvent {}

class PokemonsSearch extends PokemonsEvent {
  final String query;

  const PokemonsSearch(this.query);

  @override
  List<Object> get props => [query];
}
