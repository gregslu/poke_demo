// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pokemon_ui_state.dart';

class PokemonUiStateMapper extends ClassMapperBase<PokemonUiState> {
  PokemonUiStateMapper._();

  static PokemonUiStateMapper? _instance;
  static PokemonUiStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PokemonUiStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PokemonUiState';

  static List<PokemonApiModel> _$pokemon(PokemonUiState v) => v.pokemon;
  static const Field<PokemonUiState, List<PokemonApiModel>> _f$pokemon =
      Field('pokemon', _$pokemon, opt: true, def: const []);
  static bool _$isLoading(PokemonUiState v) => v.isLoading;
  static const Field<PokemonUiState, bool> _f$isLoading =
      Field('isLoading', _$isLoading, opt: true, def: false);
  static String _$errorMsg(PokemonUiState v) => v.errorMsg;
  static const Field<PokemonUiState, String> _f$errorMsg =
      Field('errorMsg', _$errorMsg, opt: true, def: '');

  @override
  final MappableFields<PokemonUiState> fields = const {
    #pokemon: _f$pokemon,
    #isLoading: _f$isLoading,
    #errorMsg: _f$errorMsg,
  };

  static PokemonUiState _instantiate(DecodingData data) {
    return PokemonUiState(
        pokemon: data.dec(_f$pokemon),
        isLoading: data.dec(_f$isLoading),
        errorMsg: data.dec(_f$errorMsg));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin PokemonUiStateMappable {
  PokemonUiStateCopyWith<PokemonUiState, PokemonUiState, PokemonUiState>
      get copyWith => _PokemonUiStateCopyWithImpl(
          this as PokemonUiState, $identity, $identity);
  @override
  bool operator ==(Object other) {
    return PokemonUiStateMapper.ensureInitialized()
        .equalsValue(this as PokemonUiState, other);
  }

  @override
  int get hashCode {
    return PokemonUiStateMapper.ensureInitialized()
        .hashValue(this as PokemonUiState);
  }
}

extension PokemonUiStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PokemonUiState, $Out> {
  PokemonUiStateCopyWith<$R, PokemonUiState, $Out> get $asPokemonUiState =>
      $base.as((v, t, t2) => _PokemonUiStateCopyWithImpl(v, t, t2));
}

abstract class PokemonUiStateCopyWith<$R, $In extends PokemonUiState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, PokemonApiModel,
      ObjectCopyWith<$R, PokemonApiModel, PokemonApiModel>> get pokemon;
  $R call({List<PokemonApiModel>? pokemon, bool? isLoading, String? errorMsg});
  PokemonUiStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PokemonUiStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PokemonUiState, $Out>
    implements PokemonUiStateCopyWith<$R, PokemonUiState, $Out> {
  _PokemonUiStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PokemonUiState> $mapper =
      PokemonUiStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, PokemonApiModel,
          ObjectCopyWith<$R, PokemonApiModel, PokemonApiModel>>
      get pokemon => ListCopyWith($value.pokemon,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(pokemon: v));
  @override
  $R call(
          {List<PokemonApiModel>? pokemon,
          bool? isLoading,
          String? errorMsg}) =>
      $apply(FieldCopyWithData({
        if (pokemon != null) #pokemon: pokemon,
        if (isLoading != null) #isLoading: isLoading,
        if (errorMsg != null) #errorMsg: errorMsg
      }));
  @override
  PokemonUiState $make(CopyWithData data) => PokemonUiState(
      pokemon: data.get(#pokemon, or: $value.pokemon),
      isLoading: data.get(#isLoading, or: $value.isLoading),
      errorMsg: data.get(#errorMsg, or: $value.errorMsg));

  @override
  PokemonUiStateCopyWith<$R2, PokemonUiState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PokemonUiStateCopyWithImpl($value, $cast, t);
}
