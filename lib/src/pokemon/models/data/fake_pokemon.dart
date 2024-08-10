import 'pokemon_api_model.dart';

const kFakePokemon = [
  PokemonApiModel(
      id: 1,
      name: 'bulbasaur',
      height: 7,
      weight: 69,
      sprites: PokemonSprites(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png')),
  PokemonApiModel(
    id: 2,
    name: 'ivysaur',
    height: 10,
    weight: 130,
    sprites: PokemonSprites(
        frontDefault:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png',
        frontShiny:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png'),
  ),
];
