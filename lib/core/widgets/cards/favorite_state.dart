import 'package:equatable/equatable.dart';

class FavoriteState extends Equatable {
  final Map<int, bool> favorites;

  const FavoriteState({required this.favorites});

  bool isFavorite(int pokemonId) {
    return favorites[pokemonId] ?? false;
  }

  FavoriteState copyWith({Map<int, bool>? favorites}) {
    return FavoriteState(favorites: favorites ?? this.favorites);
  }

  @override
  List<Object> get props => [favorites];
}
