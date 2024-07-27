import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';
import 'package:poke_demo/src/pokemon/models/repositories/pokemon_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/models/repositories/repository.dart';

part 'pokemons_view_model.g.dart';

@riverpod
class PokemonsViewModel extends _$PokemonsViewModel {
  Future<void> readPokemon(int pokemonId) async {
    state = const AsyncValue.loading();
    try {
      await _repository.read(pokemonId);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
    await _updateState();
  }

  Future<void> deleteLastPokemon() async {
    state = const AsyncValue.loading();
    await _repository.deleteLast();
    await _updateState();
  }

  Future<void> _updateState() async {
    state = await AsyncValue.guard(_repository.readAll);
  }

  Repository<PokemonApiModel> get _repository =>
      ref.read(pokemonRepositoryProvider);

  @override
  FutureOr<List<PokemonApiModel>> build() {
    return _repository.readAll();
  }
}
