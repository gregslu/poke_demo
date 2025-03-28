// import 'package:flutter_test/flutter_test.dart';
// import 'package:poke_demo/src/pokemon/models/data/fake_pokemon.dart';
// import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';
// import 'package:poke_demo/src/pokemon/models/data_sources/pokemon_local_data_source.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   group('Create', () {
//     test('should create one pokemon', () async {
//       SharedPreferences.setMockInitialValues({});

//       final ds = PokemonLocalDataSource();
//       await ds.create(kFakePokemon[0]);
//       final pokemon = ds.readAll();
//       expect(pokemon.length, 1);
//       expect(pokemon[0], kFakePokemon[0]);
//     });

//     test('should overwrite one existing pokemon', () async {
//       SharedPreferences.setMockInitialValues({});

//       final ds = PokemonLocalDataSource();
//       await ds.createAll(kFakePokemon);

//       final updatedHeight = kFakePokemon[0].height + 70;
//       final updated = PokemonApiModel(
//         id: kFakePokemon[0].id,
//         name: kFakePokemon[0].name,
//         height: updatedHeight,
//         weight: kFakePokemon[0].weight,
//         sprites: PokemonSprites(
//             frontDefault: kFakePokemon[0].sprites.frontDefault,
//             frontShiny: kFakePokemon[0].sprites.frontShiny),
//       );
//       await ds.create(updated);

//       expect((ds.readAll()).length, 2);
//       final pokemon = ds.read(updated.id);
//       expect(pokemon, updated);
//       expect(pokemon.height, updatedHeight);
//     });
//   });

//   group('Create all', () {
//     test('should create two pokemon', () async {
//       SharedPreferences.setMockInitialValues({});

//       final ds = PokemonLocalDataSource();
//       await ds.createAll(kFakePokemon);
//       final pokemon = ds.readAll();
//       expect(pokemon.length, 2);
//       expect(pokemon[0], kFakePokemon[0]);
//       expect(pokemon[1], kFakePokemon[1]);
//     });

//     test('should create no pokemon for empty list', () async {
//       SharedPreferences.setMockInitialValues({});

//       final ds = PokemonLocalDataSource();
//       await ds.createAll([]);
//       final pokemon = ds.readAll();
//       expect(pokemon.length, 0);
//     });
//   });

//   group('Read', () {
//     test('should read one pokemon', () async {
//       SharedPreferences.setMockInitialValues({});

//       final ds = PokemonLocalDataSource();
//       await ds.createAll(kFakePokemon);
//       final pokemon = ds.read(kFakePokemon[0].id);
//       expect(pokemon, kFakePokemon[0]);
//     });

//     test('should read no pokemon for non existing id', () async {
//       SharedPreferences.setMockInitialValues({});

//       final ds = PokemonLocalDataSource();
//       await ds.createAll(kFakePokemon);
//       final nonExistingId = kFakePokemon.last.id + 1;
//       // final pokemon = await ds.read(nonExistingId);
//       expect(() async => ds.read(nonExistingId), throwsException);
//     });
//   });

//   group('Read all', () {
//     test('should read two pokemon', () async {
//       SharedPreferences.setMockInitialValues({});

//       final ds = PokemonLocalDataSource();
//       await ds.createAll(kFakePokemon);
//       final pokemon = ds.readAll();
//       expect(pokemon.length, 2);
//       expect(pokemon[0], kFakePokemon[0]);
//       expect(pokemon[1], kFakePokemon[1]);
//     });

//     test('should read no pokemon for empty list', () async {
//       SharedPreferences.setMockInitialValues({});

//       final ds = PokemonLocalDataSource();
//       await ds.createAll([]);
//       final pokemon = ds.readAll();
//       expect(pokemon.length, 0);
//     });
//   });

//   group('Update', () {
//     test('should update one pokemon', () async {
//       SharedPreferences.setMockInitialValues({});

//       final ds = PokemonLocalDataSource();
//       await ds.createAll(kFakePokemon);

//       final updatedHeight = kFakePokemon[0].height + 70;
//       final updated = PokemonApiModel(
//         id: kFakePokemon[0].id,
//         name: kFakePokemon[0].name,
//         height: updatedHeight,
//         weight: kFakePokemon[0].weight,
//         sprites: PokemonSprites(
//             frontDefault: kFakePokemon[0].sprites.frontDefault,
//             frontShiny: kFakePokemon[0].sprites.frontShiny),
//       );
//       await ds.update(updated);

//       expect((ds.readAll()).length, 2);
//       final pokemon = ds.read(updated.id);
//       expect(pokemon, updated);
//       expect(pokemon.height, updatedHeight);
//     });

//     test('should update no pokemon for non existing id', () async {
//       SharedPreferences.setMockInitialValues({});

//       final ds = PokemonLocalDataSource();
//       await ds.createAll(kFakePokemon);

//       final nonExistingId = kFakePokemon.last.id + 1;
//       final updatedHeight = kFakePokemon[0].height + 70;
//       final updated = PokemonApiModel(
//         id: nonExistingId,
//         name: kFakePokemon[0].name,
//         height: updatedHeight,
//         weight: kFakePokemon[0].weight,
//         sprites: PokemonSprites(
//             frontDefault: kFakePokemon[0].sprites.frontDefault,
//             frontShiny: kFakePokemon[0].sprites.frontShiny),
//       );
//       await ds.update(updated);

//       expect((ds.readAll()).length, 2);
//       // final pokemon = await ds.read(updated.id);
//       expect(() async => ds.read(updated.id), throwsException);
//     });
//   });

//   group('Delete', () {
//     test('should delete one pokemon', () async {
//       SharedPreferences.setMockInitialValues({});

//       final ds = PokemonLocalDataSource();
//       await ds.createAll(kFakePokemon);

//       await ds.delete(kFakePokemon[1].id);

//       final pokemon = ds.readAll();
//       expect(pokemon.length, 1);
//       expect(pokemon[0], kFakePokemon[0]);
//     });

//     test('should delete no pokemon for non existing id', () async {
//       SharedPreferences.setMockInitialValues({});

//       final ds = PokemonLocalDataSource();
//       await ds.createAll(kFakePokemon);

//       final nonExistingId = kFakePokemon.last.id + 1;
//       await ds.delete(nonExistingId);

//       final pokemon = ds.readAll();
//       expect(pokemon.length, 2);
//       expect(pokemon[0], kFakePokemon[0]);
//       expect(pokemon[1], kFakePokemon[1]);
//     });

//     test('should delete no pokemon for multiple delete', () async {
//       SharedPreferences.setMockInitialValues({});

//       final ds = PokemonLocalDataSource();
//       await ds.createAll(kFakePokemon);

//       await ds.delete(kFakePokemon[1].id);

//       final pokemonAfterOne = ds.readAll();
//       expect(pokemonAfterOne.length, 1);
//       expect(pokemonAfterOne[0], kFakePokemon[0]);

//       await ds.delete(kFakePokemon[1].id);
//       await ds.delete(kFakePokemon[1].id);
//       await ds.delete(kFakePokemon[1].id);

//       final pokemonAfterMultiple = ds.readAll();
//       expect(pokemonAfterMultiple.length, 1);
//       expect(pokemonAfterMultiple[0], kFakePokemon[0]);
//     });
//   });
// }
