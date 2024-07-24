import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
          SizedBox(width: 16.0),
          _RemovePokemonButton(),
        ],
      ),
    );
  }
}

final _random = Random();
const _max = 1026;

class _AddPokemonButton extends ConsumerWidget {
  const _AddPokemonButton();

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

class _PokemonsList extends HookConsumerWidget {
  const _PokemonsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((final _) {
        ref
            .read(pokemonsViewModelProvider.notifier)
            .readPokemon(_random.nextInt(_max));
      });
      return null;
    }, const []);
    final pokemonsAsync = ref.watch(pokemonsViewModelProvider);
    final pokemonsOrNull = pokemonsAsync.valueOrNull;
    return pokemonsOrNull == null
        ? const SizedBox.shrink()
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

class _LoadingIndicator extends HookConsumerWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController =
        useAnimationController(duration: const Duration(seconds: 2));
    final colorTween = ColorTween(
      begin: Theme.of(context).colorScheme.primary,
      end: Theme.of(context).colorScheme.secondary,
    );
    final valueColor = animationController.drive(colorTween);
    useEffect(() {
      animationController.repeat(reverse: true);
      return null;
    }, const []);
    final isLoading =
        ref.watch(pokemonsViewModelProvider.select((s) => s.isLoading));
    return isLoading
        ? LinearProgressIndicator(
            minHeight: 8.0,
            valueColor: valueColor,
          )
        : const SizedBox.shrink();
  }
}

// class _LoadingIndicator extends ConsumerStatefulWidget {
//   const _LoadingIndicator({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _LoadingIndicatorState();
// }

// class _LoadingIndicatorState extends ConsumerState<_LoadingIndicator>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _animationController;

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat(reverse: true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isLoading =
//         ref.watch(pokemonsViewModelProvider.select((s) => s.isLoading));
//     final colorTween = ColorTween(
//       begin: Theme.of(context).colorScheme.primary,
//       end: Theme.of(context).colorScheme.secondary,
//     );
//     final valueColor = _animationController.drive(colorTween);
//     return isLoading
//         ? LinearProgressIndicator(
//             minHeight: 8.0,
//             valueColor: valueColor,
//           )
//         : const SizedBox.shrink();
//   }
// }

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
