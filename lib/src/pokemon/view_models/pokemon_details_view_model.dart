import 'package:flutter/foundation.dart';
import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';
import 'package:poke_demo/src/pokemon/views/ui_states/pokemon_details_ui_state.dart';

import '../../di.dart';

class PokemonDetailsViewModel {
  PokemonDetailsViewModel(this.pokemonId) {
    readLocal(int.parse(pokemonId));
  }

  final String pokemonId;

  final _state = ValueNotifier<PokemonDetailsUiState>(
      PokemonDetailsUiState(isLoading: true));

  ValueListenable<PokemonDetailsUiState> get state => _state;

  void consumeError() {
    _state.value = _state.value.copyWith(errorMsg: '');
  }

  void readLocal(int pokemonId) {
    _onLoading();
    try {
      final pokemon = di.repository.read(pokemonId);
      _onData(pokemon);
    } catch (e) {
      _onError(e.toString());
    }
  }

  void _onLoading() {
    _state.value = _state.value.copyWith(
      isLoading: true,
      errorMsg: '',
    );
  }

  void _onData(PokemonApiModel pokemon) {
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
