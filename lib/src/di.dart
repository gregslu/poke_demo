import 'package:poke_demo/src/network/utils/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pokemon/models/data_sources/pokemon_local_data_source.dart';
import 'pokemon/models/data_sources/pokemon_remote_data_source.dart';
import 'pokemon/models/repositories/pokemon_repository.dart';
import 'pokemon/view_models/pokemon_controller.dart';
import 'pokemon/view_models/pokemon_details_controller.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_service.dart';

final di = _Dependencies();

class _Dependencies {
  late final settingsController = SettingsController(settingsService);
  late final settingsService = SettingsService();

  late var _connectivity = Connectivity.instance;
  late var _local = PokemonLocalDataSource();
  late var _pokemonController = PokemonController();
  late var _pokemonDetailsControllerCache =
      <String, PokemonDetailsController>{};
  late var _remote = PokemonRemoteDataSource();
  late var _repository = PokemonRepository2();
  late SharedPreferences _sharedPreferences;

  Connectivity get connectivity => _connectivity;

  PokemonLocalDataSource get local => _local;

  PokemonController get pokemonController => _pokemonController;

  PokemonRemoteDataSource get remote => _remote;

  PokemonRepository2 get repository => _repository;

  SharedPreferences get sharedPreferences => _sharedPreferences;

  void override({
    Connectivity? connectivity,
    PokemonLocalDataSource? local,
    PokemonController? pokemonController,
    Map<String, PokemonDetailsController>? pokemonDetailsControllerCache,
    PokemonRemoteDataSource? remote,
    PokemonRepository2? repository,
    SharedPreferences? sharedPreferences,
  }) {
    if (connectivity != null) _connectivity = connectivity;
    if (local != null) _local = local;
    if (pokemonController != null) _pokemonController = pokemonController;
    if (pokemonDetailsControllerCache != null) {
      _pokemonDetailsControllerCache = pokemonDetailsControllerCache;
    }
    if (remote != null) _remote = remote;
    if (repository != null) _repository = repository;
    if (sharedPreferences != null) _sharedPreferences = sharedPreferences;
  }

  PokemonDetailsController getPokemonDetailsController(String pokemonId) =>
      _pokemonDetailsControllerCache.putIfAbsent(
        pokemonId,
        () => PokemonDetailsController(pokemonId),
      );

  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    await settingsController.loadSettings();
    // pokemonController.initialize();
  }
}

// class _Dependencies2 {
//   late final connectivity = Connectivity.instance;
//   late final local = PokemonLocalDataSource();
//   late final pokemonController = PokemonViewModel();
//   late final remote = PokemonRemoteDataSource();
//   late final repository = PokemonRepository2();
//   late final SharedPreferences sharedPreferences;

//   static final _pokemonDetailsControllerCache =
//       <String, PokemonDetailsViewModel>{};

//   PokemonDetailsViewModel getPokemonDetailsController(String pokemonId) =>
//       _pokemonDetailsControllerCache.putIfAbsent(
//         pokemonId,
//         () => PokemonDetailsViewModel(pokemonId),
//       );

//   Future<void> initialize() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     pokemonController.initialize();
//   }
// }
