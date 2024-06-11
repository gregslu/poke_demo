import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_demo/src/core/common_widgets/async_value_widget.dart';
import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';
import 'package:poke_demo/src/pokemon/view_models/pokemons_view_model.dart';
import 'package:poke_demo/src/pokemon/views/widgets/pokemon_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemons_page.g.dart';

/// A provider which exposes the [Pokemon] displayed by a [PokemonItem].
///
/// By retrieving the [Pokemon] through a provider instead of through its
/// constructor, this allows [PokemonItem] to be instantiated using the `const` keyword.
///
/// This ensures that when we add/remove/edit pokemons, only what the
/// impacted widgets rebuilds, instead of the entire list of items.
@riverpod
PokemonApiModel currentPokemon(CurrentPokemonRef ref) {
  return const PokemonApiModel();
}

class PokemonsPage extends ConsumerWidget {
  const PokemonsPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _PokemonsList(),
            _LoadingIndicator(),
            _ErrorIndicator(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _AddPokemonButton(),
          SizedBox(width: 8.0),
          _RemovePokemonButton(),
        ],
      ),
    );
  }
}

final _random = Random();

class _AddPokemonButton extends ConsumerWidget {
  const _AddPokemonButton();

  static const _max = 1026;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => ref
          .read(pokemonsViewModelProvider.notifier)
          .readPokemon(_random.nextInt(_max)),
      child: const Icon(Icons.add),
    );
  }
}

class _RemovePokemonButton extends ConsumerWidget {
  const _RemovePokemonButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: ref.read(pokemonsViewModelProvider.notifier).deleteLastPokemon,
      child: const Icon(Icons.remove),
    );
  }
}

class _PokemonsList extends ConsumerWidget {
  const _PokemonsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonsAsync = ref.watch(pokemonsViewModelProvider);
    return AsyncValueWidget<List<PokemonApiModel>>(
      skipLoadingOnReload: true,
      skipError: true,
      value: pokemonsAsync,
      data: (pokemons) => ListView.builder(
          restorationId: 'pokemonsListView',
          cacheExtent: pokemons.length < 100 ? pokemons.length * 100.0 : 9999.0,
          prototypeItem: const PokemonItem(),
          itemBuilder: (context, index) => ProviderScope(
                overrides: [
                  currentPokemonProvider.overrideWithValue(pokemons[index])
                ],
                child: const PokemonItem(),
              ),
          itemCount: pokemons.length),
    );
  }
}

class _LoadingIndicator extends ConsumerWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(pokemonsViewModelProvider.select((s) => s.isLoading));
    return isLoading
        ? const LinearProgressIndicator(minHeight: 8.0)
        : const SizedBox.shrink();
  }
}

class _ErrorIndicator extends ConsumerWidget {
  const _ErrorIndicator();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      pokemonsViewModelProvider,
      (prev, next) => next.whenOrNull(
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(error.toString()),
              ),
            );
        },
      ),
    );
    return const SizedBox.shrink();
  }
}
