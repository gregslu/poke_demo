import '../../../di.dart';
import '../data/pokemon_api_model.dart';

class PokemonRepository2 {
  late final _connectivity = di.connectivity;
  late final _local = di.local;
  late final _remote = di.remote;

  Future<void> deleteLast() async {
    await _local.deleteLast();
  }

  Future<void> create(int id) async {
    if (!await _connectivity.isConnected()) {
      throw Exception('No internet connection');
    }
    final pokemon = await _remote.read(id);
    await _local.create(pokemon);
  }

  PokemonApiModel read(int id) {
    return _local.read(id);
  }

  Future<void> update(PokemonApiModel pokemon) async {
    await _local.update(pokemon);
  }

  List<PokemonApiModel> readAll() {
    return _local.readAll();
  }
}
