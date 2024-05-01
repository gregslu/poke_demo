import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/models/data_sources/data_source.dart';
import '../data/pokemon_api_model.dart';

class PokemonRemoteDataSource implements DataSource<PokemonApiModel> {
  @override
  Future<PokemonApiModel> read(int id) async {
    try {
      final url = 'https://pokeapi.co/api/v2/pokemon/$id';
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 4));
      if (response.statusCode != 200) throw Exception();
      return _parsePokemon(response.body);
    } catch (e) {
      throw Exception(
          'Unable to read Pokemon with the id: $id from the remote API, $e');
    }
  }

  PokemonApiModel _parsePokemon(String responseBody) {
    final deserialized = jsonDecode(responseBody) as Map<String, dynamic>;
    return PokemonApiModel.fromJson(deserialized);
  }
}
