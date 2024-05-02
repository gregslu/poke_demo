import 'dart:convert';

import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/data_sources/data_source.dart';

class PokemonLocalDataSource implements DataSource<PokemonApiModel> {
  static const _pokemonKey = '_pokemonKey';

  // Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

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

  Future<void> update(PokemonApiModel pokemon) async {
    final pokemons = await readAll();
    final index = pokemons.indexWhere((e) => e.id == pokemon.id);
    if (index != -1) {
      pokemons[index] = pokemon;
      await createAll(pokemons);
    }
  }

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
  Future<PokemonApiModel> read(int id) async {
    final pokemons = await readAll();
    try {
      return pokemons.firstWhere((e) => e.id == id);
    } catch (e) {
      throw Exception('Pokemon with id $id not found');
    }
  }

  Future<List<PokemonApiModel>> readAll() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final jsonStr = prefs.getString(_pokemonKey);
      if (jsonStr == null) throw Exception();
      final jsonObj = jsonDecode(jsonStr) as List;
      return jsonObj.map((e) => PokemonApiModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to decode json, $e');
    }
  }

  Future<void> delete(int id) async {
    final pokemons = await readAll();
    final index = pokemons.indexWhere((e) => e.id == id);
    if (index != -1) {
      pokemons.removeAt(index);
      await createAll(pokemons);
    }
  }
}
