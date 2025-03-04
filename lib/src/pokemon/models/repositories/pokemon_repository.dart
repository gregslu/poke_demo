import 'package:flutter/foundation.dart';

import '../../../di.dart';
import '../data/pokemon_api_model.dart';

class PokemonRepository2 {
  late final _connectivity = di.connectivity;
  late final _local = di.local;
  final _pokemonNotifier = ValueNotifier<List<PokemonApiModel>>([]);
  late final _remote = di.remote;

  ValueListenable<List<PokemonApiModel>> watchAll() => _pokemonNotifier;

  ValueListenable<PokemonApiModel> watch(int id) {
    final selectedPokemonNotifier =
        ValueNotifier<PokemonApiModel>(PokemonApiModel());

    void updateSelectedPokemon() {
      selectedPokemonNotifier.value = _pokemonNotifier.value
          .firstWhere((p) => p.id == id, orElse: () => PokemonApiModel());
    }

    updateSelectedPokemon();

    _pokemonNotifier.addListener(updateSelectedPokemon);

    return selectedPokemonNotifier;
  }

  Future<void> deleteLast() async {
    await _local.deleteLast();
    _updatePokemonNotifier();
  }

  Future<void> create(int id) async {
    if (!await _connectivity.isConnected()) {
      throw Exception('No internet connection');
    }
    final pokemon = await _remote.read(id);
    await _local.create(pokemon);
    _updatePokemonNotifier();
  }

  PokemonApiModel read(int id) {
    return _local.read(id);
  }

  Future<void> update(PokemonApiModel pokemon) async {
    await _local.update(pokemon);
    _updatePokemonNotifier();
  }

  List<PokemonApiModel> readAll() {
    return _local.readAll();
  }

  // void dispose() {
  //   _pokemonNotifier.dispose();
  //   _selectedPokemonNotifier.dispose();
  // }

  void _updatePokemonNotifier() {
    _pokemonNotifier.value = readAll();
  }
}
