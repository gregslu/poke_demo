// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonHash() => r'496a34a4ca754fdb26bbc4f40a06d65f67f47273';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [pokemon].
@ProviderFor(pokemon)
const pokemonProvider = PokemonFamily();

/// See also [pokemon].
class PokemonFamily extends Family<AsyncValue<PokemonApiModel>> {
  /// See also [pokemon].
  const PokemonFamily();

  /// See also [pokemon].
  PokemonProvider call(
    int pokemonId,
  ) {
    return PokemonProvider(
      pokemonId,
    );
  }

  @override
  PokemonProvider getProviderOverride(
    covariant PokemonProvider provider,
  ) {
    return call(
      provider.pokemonId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pokemonProvider';
}

/// See also [pokemon].
class PokemonProvider extends AutoDisposeFutureProvider<PokemonApiModel> {
  /// See also [pokemon].
  PokemonProvider(
    int pokemonId,
  ) : this._internal(
          (ref) => pokemon(
            ref as PokemonRef,
            pokemonId,
          ),
          from: pokemonProvider,
          name: r'pokemonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pokemonHash,
          dependencies: PokemonFamily._dependencies,
          allTransitiveDependencies: PokemonFamily._allTransitiveDependencies,
          pokemonId: pokemonId,
        );

  PokemonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pokemonId,
  }) : super.internal();

  final int pokemonId;

  @override
  Override overrideWith(
    FutureOr<PokemonApiModel> Function(PokemonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PokemonProvider._internal(
        (ref) => create(ref as PokemonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pokemonId: pokemonId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PokemonApiModel> createElement() {
    return _PokemonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonProvider && other.pokemonId == pokemonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pokemonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PokemonRef on AutoDisposeFutureProviderRef<PokemonApiModel> {
  /// The parameter `pokemonId` of this provider.
  int get pokemonId;
}

class _PokemonProviderElement
    extends AutoDisposeFutureProviderElement<PokemonApiModel> with PokemonRef {
  _PokemonProviderElement(super.provider);

  @override
  int get pokemonId => (origin as PokemonProvider).pokemonId;
}

String _$pokemonRepositoryHash() => r'8818b1299c1ab2478625bbfe3c1e418fd7a33c95';

/// See also [pokemonRepository].
@ProviderFor(pokemonRepository)
final pokemonRepositoryProvider =
    AutoDisposeProvider<Repository<PokemonApiModel>>.internal(
  pokemonRepository,
  name: r'pokemonRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PokemonRepositoryRef
    = AutoDisposeProviderRef<Repository<PokemonApiModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
