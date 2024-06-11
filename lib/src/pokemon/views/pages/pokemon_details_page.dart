import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_demo/src/core/common_widgets/async_value_widget.dart';
import 'package:poke_demo/src/pokemon/models/repositories/pokemon_repository.dart';
import 'package:poke_demo/src/pokemon/views/widgets/pokemon_item.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    super.key,
  });

  static const routeName = 'pokemon_details';

  @override
  Widget build(BuildContext context) {
    final pokemonId = (ModalRoute.of(context)!.settings.arguments as String);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _PokemonDetailsPanel(pokemonId: pokemonId),
            _LoadingIndicator(pokemonId),
            _ErrorIndicator(pokemonId),
          ],
        ),
      ),
    );
  }
}

class _PokemonDetailsPanel extends ConsumerWidget {
  const _PokemonDetailsPanel({
    super.key,
    required this.pokemonId,
  });

  static const _size = 200.0;

  final String pokemonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonProvider(int.parse(pokemonId)));
    return AsyncValueWidget(
      skipLoadingOnReload: true,
      skipError: true,
      value: pokemonAsync,
      data: (pokemon) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(32.0),
                child: CircularImage(
                    size: _size, imageUrl: pokemon.sprites.frontDefault ?? '')),
            _Tile(title: 'Name', content: pokemon.name),
            _Tile(
                title: 'Experience',
                content: pokemon.baseExperience.toString()),
            _Tile(title: 'Height (dm)', content: pokemon.height.toString()),
            _Tile(title: 'Weight (hg)', content: pokemon.weight.toString()),
            _Tile(
                title: 'Types',
                content: pokemon.types.map((e) => e.type.name).join(', ')),
            _Tile(
                title: 'Stats',
                content: pokemon.stats
                    .map((e) => '${e.stat.name}: ${e.baseStat}')
                    .join(', ')),
            _Tile(
                title: 'Abilities',
                content:
                    pokemon.abilities.map((e) => e.ability.name).join(', ')),
            _Tile(
                title: 'Moves',
                content: pokemon.moves.map((e) => e.move.name).join(', ')),
          ],
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({super.key, required this.title, required this.content});

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
    return isLoading
        ? const LinearProgressIndicator(minHeight: 8.0)
        : const SizedBox.shrink();
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
        error: (error, stackTrace) =>
            ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            duration: const Duration(seconds: 2),
          ),
        ),
      ),
    );
    return const SizedBox.shrink();
  }
}
