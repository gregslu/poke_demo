import 'package:poke_demo/src/network/utils/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pokemon/models/data_sources/pokemon_local_data_source.dart';
import 'pokemon/models/data_sources/pokemon_remote_data_source.dart';
import 'pokemon/models/repositories/pokemon_repository.dart';
import 'pokemon/view_models/pokemon_details_view_model.dart';
import 'pokemon/view_models/pokemon_view_model.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_service.dart';

final di = _Dependencies();

class _Dependencies {
  late final settingsController = SettingsController(settingsService);
  late final settingsService = SettingsService();

  late var _connectivity = Connectivity.instance;
  late var _local = PokemonLocalDataSource();
  late var _pokemonViewModel = PokemonViewModel();
  late var _pokemonDetailsViewModelCache = <String, PokemonDetailsViewModel>{};
  late var _remote = PokemonRemoteDataSource();
  late var _repository = PokemonRepository2();
  late SharedPreferences _sharedPreferences;

  Connectivity get connectivity => _connectivity;

  PokemonLocalDataSource get local => _local;

  PokemonViewModel get pokemonViewModel => _pokemonViewModel;

  PokemonRemoteDataSource get remote => _remote;

  PokemonRepository2 get repository => _repository;

  SharedPreferences get sharedPreferences => _sharedPreferences;

  void override({
    Connectivity? connectivity,
    PokemonLocalDataSource? local,
    PokemonViewModel? pokemonViewModel,
    Map<String, PokemonDetailsViewModel>? pokemonDetailsViewModelCache,
    PokemonRemoteDataSource? remote,
    PokemonRepository2? repository,
    SharedPreferences? sharedPreferences,
  }) {
    if (connectivity != null) _connectivity = connectivity;
    if (local != null) _local = local;
    if (pokemonViewModel != null) _pokemonViewModel = pokemonViewModel;
    if (pokemonDetailsViewModelCache != null) {
      _pokemonDetailsViewModelCache = pokemonDetailsViewModelCache;
    }
    if (remote != null) _remote = remote;
    if (repository != null) _repository = repository;
    if (sharedPreferences != null) _sharedPreferences = sharedPreferences;
  }

  PokemonDetailsViewModel getPokemonDetailsViewModel(String pokemonId) =>
      _pokemonDetailsViewModelCache.putIfAbsent(
        pokemonId,
        () => PokemonDetailsViewModel(pokemonId),
      );

  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    settingsController.loadSettings();
    pokemonViewModel.initialize();
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
