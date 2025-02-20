import 'dart:convert';

import 'package:poke_demo/src/core/models/data_sources/local_data_source.dart';
import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';

import '../../../di.dart';

// part 'pokemon_local_data_source.g.dart';

class PokemonLocalDataSource implements LocalDataSource<PokemonApiModel> {
  static const _pokemonKey = '_pokemonKey';

  // Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  @override
  Future<void> create(PokemonApiModel pokemon) async {
    final pokemons = readAll();
    final first = pokemons.firstWhere((e) => e.id == pokemon.id,
        orElse: () => const PokemonApiModel());
    if (first.isEmpty) {
      pokemons.add(pokemon);
      await createAll(pokemons);
    } else {
      await update(pokemon);
    }
  }

  @override
  Future<void> createAll(List<PokemonApiModel> pokemons) async {
    try {
      final jsonObj = pokemons.map((e) => e.toJson()).toList();
      final jsonStr = jsonEncode(jsonObj);
      await di.sharedPreferences.setString(_pokemonKey, jsonStr);
    } catch (e) {
      throw Exception('Failed to encode json, $e');
    }
  }

  @override
  Future<void> delete(int id) async {
    final pokemons = readAll();
    final index = pokemons.indexWhere((e) => e.id == id);
    if (index == -1) return;
    pokemons.removeAt(index);
    await createAll(pokemons);
  }

  @override
  Future<void> deleteLast() async {
    final pokemons = readAll();
    if (pokemons.isEmpty) return;
    pokemons.removeLast();
    await createAll(pokemons);
  }

  @override
  PokemonApiModel read(int id) {
    final pokemons = readAll();
    return pokemons.firstWhere((e) => e.id == id,
        orElse: () => PokemonApiModel());
  }

  @override
  List<PokemonApiModel> readAll() {
    final jsonStr = di.sharedPreferences.getString(_pokemonKey) ?? '[]';
    try {
      final jsonObj = jsonDecode(jsonStr) as List;
      return jsonObj.map((e) => PokemonApiModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to decode json, $e');
    }
  }

  @override
  Future<void> update(PokemonApiModel pokemon) async {
    final pokemons = readAll();
    final index = pokemons.indexWhere((e) => e.id == pokemon.id);
    if (index == -1) return;
    pokemons[index] = pokemon;
    await createAll(pokemons);
  }
}
