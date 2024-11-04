// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentPokemonHash() => r'fc2c52b76d90cbbcab09b981f105b8bee0b45cab';

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
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentPokemonRef = AutoDisposeProviderRef<PokemonApiModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
