import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_demo/src/pokemon/views/pages/pokemon_details_page.dart';
import 'package:poke_demo/src/pokemon/views/pages/pokemons_page.dart';

// Overral size of [PokemonItemPrototype] and [PokemonItem] widgets must match
class PokemonItem extends ConsumerWidget {
  const PokemonItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(currentPokemonProvider);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: ListTile(
          leading: CircularImage(
            size: 55.0,
            imageUrl: pokemon.sprites.frontShiny ??
                pokemon.sprites.frontDefault ??
                '',
          ),
          title: Text(pokemon.name),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Text('ID: ${pokemon.id}'),
                const SizedBox(width: 16.0),
                Text('Order: ${pokemon.order}'),
              ],
            ),
          ),
          onTap: () => Navigator.of(context).pushNamed(
            PokemonDetails.routeName,
            arguments: pokemon.id.toString(),
          ),
        ),
      ),
    );
  }
}

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    required this.size,
    required this.imageUrl,
  });

  final String imageUrl;
  final double size;

  static const _flutterLogo = CircleAvatar(
      foregroundImage: AssetImage('assets/images/flutter_logo.png'));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size)),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        child: ClipOval(
          child: imageUrl.isEmpty
              ? _flutterLogo
              : CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: imageUrl,
                  placeholder: (context, url) => _flutterLogo,
                  errorWidget: (context, url, error) => _flutterLogo,
                ),
        ),
      ),
    );
  }
}
