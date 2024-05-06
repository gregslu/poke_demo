import 'dart:convert';

import 'package:poke_demo/src/core/models/data_sources/local_data_source.dart';
import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pokemon_local_data_source.g.dart';

@riverpod
LocalDataSource<PokemonApiModel> pokemonLocalDataSource(
    PokemonLocalDataSourceRef ref) {
  return PokemonLocalDataSource();
}

class PokemonLocalDataSource implements LocalDataSource<PokemonApiModel> {
  static const _pokemonKey = '_pokemonKey';

  @override
  Future<PokemonApiModel> read(int id) async {
    final pokemons = await readAll();
    return pokemons.firstWhere((e) => e.id == id,
        orElse: () => throw Exception('Pokemon with id $id not found'));
  }

  // Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  @override
  Future<void> create(PokemonApiModel pokemon) async {
    final pokemons = await readAll();
    final index = pokemons.indexWhere((e) => e.id == pokemon.id);
    if (index == -1) {
      pokemons.add(pokemon);
      await createAll(pokemons);
    } else {
      update(pokemon);
    }
  }

  @override
  Future<void> update(PokemonApiModel pokemon) async {
    final pokemons = await readAll();
    final index = pokemons.indexWhere((e) => e.id == pokemon.id);
    if (index != -1) {
      pokemons[index] = pokemon;
      await createAll(pokemons);
    }
  }

  @override
  Future<void> createAll(List<PokemonApiModel> pokemons) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final jsonObj = pokemons.map((e) => e.toJson()).toList();
      final jsonStr = jsonEncode(jsonObj);
      prefs.setString(_pokemonKey, jsonStr);
    } catch (e) {
      throw Exception('Failed to encode json, $e');
    }
  }

  @override
  Future<List<PokemonApiModel>> readAll() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final jsonStr = prefs.getString(_pokemonKey);
      if (jsonStr == null) {
        throw Exception('Cannot decode ${jsonStr.runtimeType}');
      }
      final jsonObj = jsonDecode(jsonStr) as List;
      return jsonObj.map((e) => PokemonApiModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to decode json, $e');
    }
  }

  @override
  Future<void> delete(int id) async {
    final pokemons = await readAll();
    final index = pokemons.indexWhere((e) => e.id == id);
    if (index != -1) {
      pokemons.removeAt(index);
      await createAll(pokemons);
    }
  }
}
