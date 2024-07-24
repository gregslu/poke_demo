import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_demo/src/settings/settings_controller.dart';

import 'src/app.dart';
import 'src/core/models/data_sources/local_data_source.dart';
import 'src/core/models/data_sources/remote_data_source.dart';
import 'src/pokemon/models/data_sources/pokemon_local_data_source.dart';
import 'src/pokemon/models/data_sources/pokemon_remote_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer(overrides: [
    localDataSourceProvider.overrideWithValue(
      PokemonLocalDataSource(),
    ),
    remoteDataSourceProvider.overrideWithValue(
      PokemonRemoteDataSource(),
    ),
  ]);
  await container.read(settingsControllerProvider).loadSettings();
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}
