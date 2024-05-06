import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_demo/src/network/utils/connectivity.dart';
import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/data_sources/local_data_source.dart';
import '../../../core/models/data_sources/remote_data_source.dart';
import '../../../core/models/repositories/repository.dart';
import '../data_sources/pokemon_local_data_source.dart';
import '../data_sources/pokemon_remote_data_source.dart';

part 'pokemon_repository.g.dart';

@riverpod
Repository<PokemonApiModel> pokemonRepository(PokemonRepositoryRef ref) {
  return PokemonRepository(ref);
}

class PokemonRepository implements Repository<PokemonApiModel> {
  PokemonRepository(this.ref);

  final Ref ref;

  LocalDataSource<PokemonApiModel> get _local =>
      ref.read(pokemonLocalDataSourceProvider);
  RemoteDataSource<PokemonApiModel> get _remote =>
      ref.read(pokemonRemoteDataSourceProvider);
  Connectivity get _connectivity => ref.read(connectivityProvider);

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<PokemonApiModel> read(int id) async {
    if (await _connectivity.isConnected()) {
      final pokemon = await _remote.read(id);
      await _local.create(pokemon);
    }
    return _local.read(id);
  }

  @override
  Future<List<PokemonApiModel>> readAll() {
    // TODO: implement readAll
    throw UnimplementedError();
  }
}
