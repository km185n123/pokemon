import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/detailpokemon/domain/usecases/get_pokemon_detail.dart';
import 'package:pokemon/features/detailpokemon/presentation/cubit/pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  final GetPokemonDetailUseCase _getPokemonDetailUseCase;

  PokemonDetailCubit(this._getPokemonDetailUseCase)
    : super(PokemonDetailInitial());

  Future<void> loadPokemonDetail(int id) async {
    emit(PokemonDetailLoading());

    final failureOrPokemonDetail = await _getPokemonDetailUseCase(id);

    failureOrPokemonDetail.fold(
      (failure) => emit(PokemonDetailError(failure.message)),
      (pokemonDetail) => emit(PokemonDetailLoaded(pokemonDetail)),
    );
  }
}
