import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_demo/src/core/utils/demo_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/data_sources/local_data_source.dart';
import '../../../core/models/data_sources/remote_data_source.dart';
import '../../../core/models/repositories/repository.dart';
import '../../../network/utils/connectivity.dart';
import '../data/pokemon_api_model.dart';

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

  // This is alternative way of doing dependency injection. One could argue that it's worst, because it's implicit (btw. with Riverpod we ovverrite dependencies in the ProviderScope). It's here for fun :)
  final Ref ref;

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> deleteLast() async {
    await _demoHelper.artificialDelay();
    await _local.deleteLast();
  }

  @override
  Future<PokemonApiModel> read(int id) async {
    // Artificial delay
    await _demoHelper.artificialDelay();
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

  LocalDataSource<PokemonApiModel> get _local =>
      ref.read(localDataSourceProvider);

  RemoteDataSource<PokemonApiModel> get _remote =>
      ref.read(remoteDataSourceProvider);

  DemoHelper get _demoHelper => ref.read(demoHelperProvider);

  Connectivity get _connectivity => ref.read(connectivityProvider);
}
