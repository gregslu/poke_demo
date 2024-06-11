import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/data_sources/local_data_source.dart';
import '../../../core/models/data_sources/remote_data_source.dart';
import '../../../core/models/repositories/repository.dart';
import '../../../network/utils/connectivity.dart';
import '../data/pokemon_api_model.dart';
import '../data_sources/pokemon_local_data_source.dart';
import '../data_sources/pokemon_remote_data_source.dart';

part 'pokemon_repository.g.dart';

@riverpod
Repository<PokemonApiModel> pokemonRepository(PokemonRepositoryRef ref) {
  return PokemonRepository(ref);
}

@riverpod
FutureOr<PokemonApiModel> pokemon(PokemonRef ref, int pokemonId) async {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);
  return pokemonRepository.read(pokemonId);
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
  Future<void> deleteLast() async {
    _local.deleteLast();
  }

  @override
  Future<PokemonApiModel> read(int id) async {
    if (await _connectivity.isConnected()) {
      final pokemon = await _remote.read(id);
      await _local.create(pokemon);
      return _local.read(id);
    }
    throw Exception('No internet connection');
  }

  @override
  Future<List<PokemonApiModel>> readAll() {
    return _local.readAll();
  }
}
