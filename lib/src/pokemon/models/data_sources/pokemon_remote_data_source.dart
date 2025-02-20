import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/models/data_sources/remote_data_source.dart';
import '../data/pokemon_api_model.dart';

class PokemonRemoteDataSource implements RemoteDataSource<PokemonApiModel> {
  @override
  Future<PokemonApiModel> read(int id) async {
    try {
      final uri = Uri.https('pokeapi.co', '/api/v2/pokemon/$id');
      final response = await http.get(uri).timeout(const Duration(seconds: 4));
      if (response.statusCode != 200) {
        throw Exception('Status code ${response.statusCode}');
      }
      return _parsePokemon(response.body);
    } catch (e) {
      throw Exception(
          'Unable to read Pokemon with the id: $id from the remote API, $e');
    }
  }

  PokemonApiModel _parsePokemon(String jsonStr) {
    final jsonObj = jsonDecode(jsonStr) as Map<String, dynamic>;
    return PokemonApiModel.fromJson(jsonObj);
  }
}
