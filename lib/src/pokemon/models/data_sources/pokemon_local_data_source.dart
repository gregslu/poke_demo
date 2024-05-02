import 'dart:convert';

import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/data_sources/data_source.dart';

class PokemonLocalDataSource implements DataSource<PokemonApiModel> {
  static const _pokemonKey = '_pokemonKey';

  // Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  Future<void> create(PokemonApiModel pokemon) async {
    final all = await readAll();
    final index = all.indexWhere((e) => e.id == pokemon.id);
    if (index == -1) {
      all.add(pokemon);
    } else {
      // update instead, if it already exists
      all[index] = pokemon;
    }
    await createAll(all);
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
  Future<PokemonApiModel> read(int id) {
    // TODO: implement read
    throw UnimplementedError();
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

  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
