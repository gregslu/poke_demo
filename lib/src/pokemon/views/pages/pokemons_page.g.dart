// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentPokemonHash() => r'e8f0b1b6755600c767ae9507d4f432aafdde5b18';

/// A provider which exposes the [Pokemon] displayed by a [PokemonItem].
///
/// By retrieving the [Pokemon] through a provider instead of through its
/// constructor, this allows [PokemonItem] to be instantiated using the `const` keyword.
///
/// This ensures that when we add/remove/edit pokemons, only what the
/// impacted widgets rebuilds, instead of the entire list of items.
///
/// Copied from [currentPokemon].
@ProviderFor(currentPokemon)
final currentPokemonProvider = AutoDisposeProvider<PokemonApiModel>.internal(
  currentPokemon,
  name: r'currentPokemonProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentPokemonHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentPokemonRef = AutoDisposeProviderRef<PokemonApiModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
