import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';

import '../../../core/models/repositories/repository.dart';

class PokemonRepository implements Repository<PokemonApiModel> {
  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<PokemonApiModel> read(int id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<List<PokemonApiModel>> readAll() {
    // TODO: implement readAll
    throw UnimplementedError();
  }
}
