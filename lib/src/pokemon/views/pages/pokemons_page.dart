import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';
import 'package:poke_demo/src/pokemon/view_models/pokemons_view_model.dart';
import 'package:poke_demo/src/pokemon/views/widgets/pokemon_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../widgets/loading_indicator.dart';

part 'pokemons_page.g.dart';

class PokemonsPage extends ConsumerWidget {
  const PokemonsPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
      ),
      body: const SafeArea(
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
          _AddPokemonButton(key: addPokemonButtonKey),
          const SizedBox(width: 16.0),
          _RemovePokemonButton(key: removePokemonButtonKey),
        ],
      ),
    );
  }
}

final _random = Random();
const _max = 1026;

class _AddPokemonButton extends ConsumerWidget {
  const _AddPokemonButton({super.key});

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
  const _RemovePokemonButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: ref.read(pokemonsViewModelProvider.notifier).deleteLastPokemon,
      child: const Icon(Icons.remove),
    );
  }
}

class _PokemonsList extends HookConsumerWidget {
  const _PokemonsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((final _) {
        Future.delayed(
            Duration.zero,
            () => ref
                .read(pokemonsViewModelProvider.notifier)
                .readPokemon(_random.nextInt(_max)));
      });
      return null;
    }, const []);
    final pokemonsOrNull = ref.watch(pokemonsViewModelProvider).valueOrNull;
    return pokemonsOrNull == null || pokemonsOrNull.isEmpty
        ? const _Empty()
        : ListView.builder(
            restorationId: 'pokemonsListView',
            cacheExtent: pokemonsOrNull.length < 100
                ? pokemonsOrNull.length * 100.0
                : 9999.0,
            prototypeItem: const PokemonItem(),
            itemBuilder: (context, index) => ProviderScope(
                  overrides: [
                    currentPokemonProvider
                        .overrideWithValue(pokemonsOrNull[index])
                  ],
                  child: const PokemonItem(),
                ),
            itemCount: pokemonsOrNull.length);
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/void.svg',
              width: 150,
              height: 150, //asset location
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'No pokemon yet',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingIndicator extends ConsumerWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(pokemonsViewModelProvider.select((s) => s.isLoading));
    return isLoading ? const LoadingIndicator() : const SizedBox.shrink();
  }
}

class _ErrorIndicator extends ConsumerWidget {
  const _ErrorIndicator();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      pokemonsViewModelProvider,
      (prev, next) => next.whenOrNull(
        error: (error, stackTrace) => ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(error.toString()),
            ),
          ),
      ),
    );
    return const SizedBox.shrink();
  }
}

/// A provider which exposes the [Pokemon] displayed by a [PokemonItem].
///
/// By retrieving the [Pokemon] through a provider instead of through its
/// constructor, this allows [PokemonItem] to be instantiated using the `const` keyword.
///
/// This ensures that when we add/remove/edit pokemons, only what the
/// impacted widgets rebuilds, instead of the entire list of items.
@Riverpod(dependencies: [])
PokemonApiModel currentPokemon(Ref ref) {
  return const PokemonApiModel();
}

// Keys used for testing
final addPokemonButtonKey = UniqueKey();
final removePokemonButtonKey = UniqueKey();
