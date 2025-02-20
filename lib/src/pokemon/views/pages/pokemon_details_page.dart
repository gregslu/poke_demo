import 'package:context_watch/context_watch.dart';
import 'package:flutter/material.dart';

import '../../../di.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/pokemon_item.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    super.key,
  });

  static const routeName = 'pokemon_details';

  @override
  Widget build(BuildContext context) {
    debugPrint('****** PokemonDetails rebuild *******');
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

class _PokemonDetailsPanel extends StatelessWidget {
  const _PokemonDetailsPanel(this.pokemonId);

  final String pokemonId;

  static const _size = 200.0;

  @override
  Widget build(BuildContext context) {
    final pokemon = di
        .getPokemonDetailsViewModel(pokemonId)
        .state
        .watchOnly(context, (state) => state.value.pokemon);

    return pokemon.isEmpty
        ? const SizedBox.shrink()
        : SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: CircularImage(
                      size: _size,
                      imageUrl: pokemon.sprites.frontDefault ??
                          pokemon.sprites.frontShiny ??
                          '',
                    )),
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
                    content: pokemon.abilities
                        .map((e) => e.ability.name)
                        .join(', ')),
                _Tile(
                    title: 'Moves',
                    content: pokemon.moves.map((e) => e.move.name).join(', ')),
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

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator(this.pokemonId);

  final String pokemonId;

  @override
  Widget build(BuildContext context) {
    final isLoading = di
        .getPokemonDetailsViewModel(pokemonId)
        .state
        .watchOnly(context, (state) => state.value.isLoading);
    return isLoading ? const LoadingIndicator() : const SizedBox.shrink();
  }
}

class _ErrorIndicator extends StatelessWidget {
  const _ErrorIndicator(this.pokemonId);

  final String pokemonId;

  void _showSnackBar(BuildContext context, String errorMsg) {
    final snackbar = SnackBar(content: Text(errorMsg));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
    di.pokemonViewModel.consumeError();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonDetailsController = di.getPokemonDetailsViewModel(pokemonId);
    final errorMsg = pokemonDetailsController.state
        .watchOnly(context, (state) => state.value.errorMsg);

    if (errorMsg.isNotEmpty) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _showSnackBar(context, errorMsg));
    }
    return const SizedBox.shrink();
  }
}
