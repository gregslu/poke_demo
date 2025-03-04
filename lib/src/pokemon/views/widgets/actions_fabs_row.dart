import 'dart:math';

import 'package:flutter/material.dart';

import '../../../di.dart';

// Keys used for testing
final buttonAddKey = UniqueKey();
final buttonRemoveKey = UniqueKey();

final _random = Random();
const _max = 1025;

class ActionsFabsRow extends StatelessWidget {
  const ActionsFabsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _AddPokemonButton(key: buttonAddKey),
        const SizedBox(width: 16.0),
        _RemovePokemonButton(key: buttonRemoveKey),
      ],
    );
  }
}

class _AddPokemonButton extends StatelessWidget {
  const _AddPokemonButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'buttonAdd',
      onPressed: () =>
          di.pokemonController.createPokemon(_random.nextInt(_max) + 1),
      child: const Icon(Icons.add),
    );
  }
}

class _RemovePokemonButton extends StatelessWidget {
  const _RemovePokemonButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'buttonDelete',
      onPressed: di.pokemonController.deleteLastPokemon,
      child: const Icon(Icons.remove),
    );
  }
}
