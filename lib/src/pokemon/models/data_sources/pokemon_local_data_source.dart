import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';

import '../../../core/models/data_sources/data_source.dart';

class PokemonLocalDataSource implements DataSource<PokemonApiModel> {
  @override
  Future<PokemonApiModel> read(int id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  Future<PokemonApiModel> readAll() {
    throw UnimplementedError();
  }

  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
