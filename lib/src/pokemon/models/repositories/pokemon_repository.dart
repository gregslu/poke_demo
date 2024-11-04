import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/data_sources/local_data_source.dart';
import '../../../core/models/data_sources/remote_data_source.dart';
import '../../../core/models/repositories/repository.dart';
import '../../../core/utils/demo_helper.dart';
import '../../../network/utils/connectivity.dart';
import '../data/pokemon_api_model.dart';
import '../data_sources/pokemon_local_data_source.dart';
import '../data_sources/pokemon_remote_data_source.dart';

part 'pokemon_repository.g.dart';

@riverpod
FutureOr<PokemonApiModel> pokemon(Ref ref, int pokemonId) async {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);
  return pokemonRepository.read(pokemonId);
}

class PokemonRepository implements Repository<PokemonApiModel> {
  PokemonRepository(this.ref);

  final Ref ref;

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> deleteLast() async {
    // if ((await _local.readAll()).isEmpty) {
    //   return;
    // }
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
      // return pokemon;
      return await _local.read(id);
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

@riverpod
Repository<PokemonApiModel> pokemonRepository(Ref ref) {
  return PokemonRepository(ref);
}
