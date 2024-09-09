import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_demo/src/pokemon/models/repositories/pokemon_repository.dart';
import 'package:poke_demo/src/pokemon/views/widgets/pokemon_item.dart';

import '../widgets/loading_indicator.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    super.key,
  });

  static const routeName = 'pokemon_details';

  @override
  Widget build(BuildContext context) {
    final pokemonId = (ModalRoute.of(context)!.settings.arguments as String);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Details'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            _PokemonDetailsPanel(pokemonId),
            _LoadingIndicator(pokemonId),
            _ErrorIndicator(pokemonId),
          ],
        ),
      ),
    );
  }
}

class _PokemonDetailsPanel extends ConsumerWidget {
  const _PokemonDetailsPanel(this.pokemonId);

  final String pokemonId;

  static const _size = 200.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonProvider(int.parse(pokemonId)));
    final pokemonOrNull = pokemonAsync.valueOrNull;
    return pokemonOrNull == null
        ? const SizedBox.shrink()
        : SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: CircularImage(
                      size: _size,
                      imageUrl: pokemonOrNull.sprites.frontDefault ??
                          pokemonOrNull.sprites.frontShiny ??
                          '',
                    )),
                _Tile(title: 'Name', content: pokemonOrNull.name),
                _Tile(
                    title: 'Experience',
                    content: pokemonOrNull.baseExperience.toString()),
                _Tile(
                    title: 'Height (dm)',
                    content: pokemonOrNull.height.toString()),
                _Tile(
                    title: 'Weight (hg)',
                    content: pokemonOrNull.weight.toString()),
                _Tile(
                    title: 'Types',
                    content:
                        pokemonOrNull.types.map((e) => e.type.name).join(', ')),
                _Tile(
                    title: 'Stats',
                    content: pokemonOrNull.stats
                        .map((e) => '${e.stat.name}: ${e.baseStat}')
                        .join(', ')),
                _Tile(
                    title: 'Abilities',
                    content: pokemonOrNull.abilities
                        .map((e) => e.ability.name)
                        .join(', ')),
                _Tile(
                    title: 'Moves',
                    content:
                        pokemonOrNull.moves.map((e) => e.move.name).join(', ')),
              ],
            ),
          );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.title, required this.content});

  final String content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('${title.toUpperCase()}: $content'),
    );
  }
}

class _LoadingIndicator extends ConsumerWidget {
  const _LoadingIndicator(this.pokemonId);

  final String pokemonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
        pokemonProvider(int.parse(pokemonId)).select((s) => s.isLoading));
    return isLoading ? const LoadingIndicator() : const SizedBox.shrink();
  }
}

class _ErrorIndicator extends ConsumerWidget {
  const _ErrorIndicator(this.pokemonId);

  final String pokemonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      pokemonProvider(int.parse(pokemonId)),
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
