import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/models/data_sources/remote_data_source.dart';
import '../../../di.dart';
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

  Future<List<PokemonApiModel>> readAll() async {
    /// create pokemon urls
    final urls = <String>[];
    final localIds = di.local.readAll().map((e) => e.id);
    for (var id in localIds) {
      urls.add('https://pokeapi.co/api/v2/pokemon/$id/');
    }

    try {
      final pokemon = await Future.wait<PokemonApiModel>(urls.map((url) async {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode != 200) {
          throw Exception('Status code ${response.statusCode}');
        }
        return _parsePokemon(response.body);
      }));

      return pokemon;
    } on Exception catch (e) {
      throw Exception('Unable to read all pokemon from API, ${e.toString()}');
    }
  }

  PokemonApiModel _parsePokemon(String jsonStr) {
    final jsonObj = jsonDecode(jsonStr) as Map<String, dynamic>;
    return PokemonApiModel.fromJson(jsonObj);
  }
}
