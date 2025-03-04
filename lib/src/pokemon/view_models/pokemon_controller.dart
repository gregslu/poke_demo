import 'package:flutter/foundation.dart';
import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';
import 'package:poke_demo/src/pokemon/views/ui_states/pokemon_ui_state.dart';

import '../../di.dart';

class PokemonController {
  PokemonController() {
    final pokemonListenable = _repository.watchAll();
    pokemonListenable.addListener(() => _onData(pokemonListenable.value));
  }

  late final _repository = di.repository;
  final _state = ValueNotifier<PokemonUiState>(PokemonUiState());

  ValueListenable<PokemonUiState> get state => _state;

  void consumeError() {
    _state.value = _state.value.copyWith(errorMsg: '');
  }

  Future<void> createPokemon(int pokemonId) async {
    _onLoading();
    try {
      await _repository.create(pokemonId);
    } catch (e) {
      _onError(e.toString());
    }
  }

  Future<void> deleteLastPokemon() async {
    _onLoading();
    try {
      await _repository.deleteLast();
    } catch (e) {
      _onError(e.toString());
    }
  }

  void initialize() {
    _onLoading();
    try {
      final pokemon = _repository.readAll();
      _onData(pokemon);
    } catch (e) {
      _onError(e.toString());
    } finally {
      refresh();
    }
  }

  Future<void> refresh() async {
    _onLoading();
    try {
      await _repository.refresh();
    } on Exception catch (e) {
      _onError('Unable to refresh pokemon, $e');
    }
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
