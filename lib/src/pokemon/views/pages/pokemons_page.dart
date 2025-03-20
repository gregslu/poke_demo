import 'dart:math';

import 'package:context_watch/context_watch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poke_demo/src/pokemon/models/data/fake_pokemon.dart';
import 'package:poke_demo/src/pokemon/views/widgets/actions_fabs_row.dart';
import 'package:poke_demo/src/pokemon/views/widgets/pokemon_item.dart';

import '../../../di.dart';
import '../widgets/loading_indicator.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({super.key});

  static const routeName = '/';

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final _) async {
      await di.pokemonController.initialize();
      await di.pokemonController.createPokemon(_random.nextInt(_max) + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('PokemonsPage rebuild');
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
      floatingActionButton: const ActionsFabsRow(),
    );
  }
}

final _random = Random();
const _max = 1025;

class _PokemonsList extends StatelessWidget {
  const _PokemonsList();

  @override
  Widget build(BuildContext context) {
    final pokemon = di.pokemonController.state
        .watchOnly(context, (state) => state.value.pokemon);
    debugPrint('_PokemonsList rebuild pokemon: ${pokemon.map((e) => e.name)}');
    return pokemon.isEmpty
        ? const _Empty()
        : ListView.builder(
            // padding: EdgeInsets.symmetric(
            //     vertical: Theme.of(context).cardTheme.margin?.vertical ?? 4),
            restorationId: 'pokemonsListView',
            cacheExtent: 5000,
            prototypeItem: PokemonItem(
              kFakePokemon[0],
            ),
            itemBuilder: (context, index) => PokemonItem(pokemon[index]),
            itemCount: pokemon.length);
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

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    final isLoading = di.pokemonController.state
        .watchOnly(context, (state) => state.value.isLoading);
    // final isLoading =
    //     ref.watch(pokemonsViewModelProvider.select((s) => s.isLoading));
    return isLoading ? const LoadingIndicator() : const SizedBox.shrink();
  }
}

class _ErrorIndicator extends StatelessWidget {
  const _ErrorIndicator();

  void _showSnackBar(BuildContext context, String errorMsg) {
    final snackbar = SnackBar(content: Text(errorMsg));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
    di.pokemonController.consumeError();
  }

  @override
  Widget build(BuildContext context) {
    final errorMsg = di.pokemonController.state
        .watchOnly(context, (state) => state.value.errorMsg);

    if (errorMsg.isNotEmpty) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _showSnackBar(context, errorMsg));
    }
    return const SizedBox.shrink();
  }
}
