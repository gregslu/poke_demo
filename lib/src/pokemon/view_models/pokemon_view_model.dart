import 'package:flutter/foundation.dart';
import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';
import 'package:poke_demo/src/pokemon/views/ui_states/pokemon_ui_state.dart';

import '../../di.dart';

class PokemonViewModel {
  late final _repository = di.repository;
  final _state = ValueNotifier<PokemonUiState>(PokemonUiState());

  ValueListenable<PokemonUiState> get state => _state;

  void initialize() => _updateState();

  void consumeError() {
    _state.value = _state.value.copyWith(errorMsg: '');
  }

  Future<void> createPokemon(int pokemonId) async {
    _onLoading();
    try {
      await _repository.create(pokemonId);
      _updateState();
    } catch (e) {
      _onError(e.toString());
    }
  }

  Future<void> deleteLastPokemon() async {
    _onLoading();
    try {
      await _repository.deleteLast();
      _updateState();
    } catch (e) {
      _onError(e.toString());
    }
  }

  void _updateState() {
    final pokemon = _repository.readAll();
    _onData(pokemon);
  }

  void _onLoading() {
    _state.value = _state.value.copyWith(
      isLoading: true,
      errorMsg: '',
    );
  }

  void _onData(List<PokemonApiModel> pokemon) {
    _state.value = _state.value.copyWith(
      pokemon: pokemon,
      isLoading: false,
      errorMsg: '',
    );
  }

  void _onError(String msg) {
    _state.value = _state.value.copyWith(
      isLoading: false,
      errorMsg: msg,
    );
  }
}

// @riverpod
// class PokemonsViewModel extends _$PokemonsViewModel {
//   Future<void> readPokemon(int pokemonId) async {
//     state = const AsyncValue.loading();
//     try {
//       await _repository.create(pokemonId);
//     } catch (e, stackTrace) {
//       state = AsyncValue.error(e, stackTrace);
//     }
//     await _updateState();
//   }

//   Future<void> deleteLastPokemon() async {
//     state = const AsyncValue.loading();
//     await _repository.deleteLast();
//     await _updateState();
//   }

//   Future<void> _updateState() async {
//     state = await AsyncValue.guard(_repository.readAll);
//   }

//   Repository<PokemonApiModel> get _repository =>
//       ref.read(pokemonRepositoryProvider);

//   @override
//   FutureOr<List<PokemonApiModel>> build() {
//     return _repository.readAll();
//   }
// }
