import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/models/data_sources/data_source.dart';
import '../data/pokemon_api_model.dart';

class PokemonRemoteDataSource implements DataSource<PokemonApiModel> {
  @override
  Future<PokemonApiModel> read(int id) async {
    try {
      final res = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'))
          .timeout(const Duration(seconds: 4));
      if (res.statusCode == 200) {
        final json = jsonDecode(res.body) as Map<String, dynamic>;
        return PokemonApiModel.fromJson(json);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(
          'Unable to read Pokemon with the id: $id from the remote API, ${e.toString()}');
    }
  }
}
