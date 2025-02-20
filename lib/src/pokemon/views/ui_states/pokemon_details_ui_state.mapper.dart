// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pokemon_details_ui_state.dart';

class PokemonDetailsUiStateMapper
    extends ClassMapperBase<PokemonDetailsUiState> {
  PokemonDetailsUiStateMapper._();

  static PokemonDetailsUiStateMapper? _instance;
  static PokemonDetailsUiStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PokemonDetailsUiStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PokemonDetailsUiState';

  static PokemonApiModel _$pokemon(PokemonDetailsUiState v) => v.pokemon;
  static const Field<PokemonDetailsUiState, PokemonApiModel> _f$pokemon =
      Field('pokemon', _$pokemon, opt: true, def: const PokemonApiModel());
  static bool _$isLoading(PokemonDetailsUiState v) => v.isLoading;
  static const Field<PokemonDetailsUiState, bool> _f$isLoading =
      Field('isLoading', _$isLoading, opt: true, def: false);
  static String _$errorMsg(PokemonDetailsUiState v) => v.errorMsg;
  static const Field<PokemonDetailsUiState, String> _f$errorMsg =
      Field('errorMsg', _$errorMsg, opt: true, def: '');

  @override
  final MappableFields<PokemonDetailsUiState> fields = const {
    #pokemon: _f$pokemon,
    #isLoading: _f$isLoading,
    #errorMsg: _f$errorMsg,
  };

  static PokemonDetailsUiState _instantiate(DecodingData data) {
    return PokemonDetailsUiState(
        pokemon: data.dec(_f$pokemon),
        isLoading: data.dec(_f$isLoading),
        errorMsg: data.dec(_f$errorMsg));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin PokemonDetailsUiStateMappable {
  PokemonDetailsUiStateCopyWith<PokemonDetailsUiState, PokemonDetailsUiState,
          PokemonDetailsUiState>
      get copyWith => _PokemonDetailsUiStateCopyWithImpl(
          this as PokemonDetailsUiState, $identity, $identity);
  @override
  bool operator ==(Object other) {
    return PokemonDetailsUiStateMapper.ensureInitialized()
        .equalsValue(this as PokemonDetailsUiState, other);
  }

  @override
  int get hashCode {
    return PokemonDetailsUiStateMapper.ensureInitialized()
        .hashValue(this as PokemonDetailsUiState);
  }
}

extension PokemonDetailsUiStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PokemonDetailsUiState, $Out> {
  PokemonDetailsUiStateCopyWith<$R, PokemonDetailsUiState, $Out>
      get $asPokemonDetailsUiState =>
          $base.as((v, t, t2) => _PokemonDetailsUiStateCopyWithImpl(v, t, t2));
}

abstract class PokemonDetailsUiStateCopyWith<
    $R,
    $In extends PokemonDetailsUiState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({PokemonApiModel? pokemon, bool? isLoading, String? errorMsg});
  PokemonDetailsUiStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PokemonDetailsUiStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PokemonDetailsUiState, $Out>
    implements PokemonDetailsUiStateCopyWith<$R, PokemonDetailsUiState, $Out> {
  _PokemonDetailsUiStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PokemonDetailsUiState> $mapper =
      PokemonDetailsUiStateMapper.ensureInitialized();
  @override
  $R call({PokemonApiModel? pokemon, bool? isLoading, String? errorMsg}) =>
      $apply(FieldCopyWithData({
        if (pokemon != null) #pokemon: pokemon,
        if (isLoading != null) #isLoading: isLoading,
        if (errorMsg != null) #errorMsg: errorMsg
      }));
  @override
  PokemonDetailsUiState $make(CopyWithData data) => PokemonDetailsUiState(
      pokemon: data.get(#pokemon, or: $value.pokemon),
      isLoading: data.get(#isLoading, or: $value.isLoading),
      errorMsg: data.get(#errorMsg, or: $value.errorMsg));

  @override
  PokemonDetailsUiStateCopyWith<$R2, PokemonDetailsUiState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PokemonDetailsUiStateCopyWithImpl($value, $cast, t);
}
