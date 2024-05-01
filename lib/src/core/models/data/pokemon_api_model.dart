part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
    required String name,
    required int baseExperience,
    required int height,
    required bool isDefault,
    required int order,
    required int weight,
    required List<Ability> abilities,
    required List<Move> moves,
    required Sprites sprites,
    required List<Stat> stats,
    required List<Type> types,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}

@freezed
class Ability with _$Ability {
  const factory Ability({
    required AbilityInfo ability,
    required bool isHidden,
    required int slot,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
}

@freezed
class AbilityInfo with _$AbilityInfo {
  const factory AbilityInfo({
    required String name,
    required String url,
  }) = _AbilityInfo;

  factory AbilityInfo.fromJson(Map<String, dynamic> json) =>
      _$AbilityInfoFromJson(json);
}

@freezed
class Move with _$Move {
  const factory Move({
    required MoveInfo move,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}

@freezed
class MoveInfo with _$MoveInfo {
  const factory MoveInfo({
    required String name,
    required String url,
  }) = _MoveInfo;

  factory MoveInfo.fromJson(Map<String, dynamic> json) =>
      _$MoveInfoFromJson(json);
}

@freezed
class Sprites with _$Sprites {
  const factory Sprites({
    required String backDefault,
    required String backFemale,
    required String backShiny,
    required String backShinyFemale,
    required String frontDefault,
    required String frontFemale,
    required String frontShiny,
    required String frontShinyFemale,
    required Other other,
  }) = _Sprites;

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
}

@freezed
class Other with _$Other {
  const factory Other({
    required DreamWorld dreamWorld,
    required Home home,
    required OfficialArtwork officialArtwork,
  }) = _Other;

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);
}

@freezed
class DreamWorld with _$DreamWorld {
  const factory DreamWorld({
    required String frontDefault,
    required String frontFemale,
  }) = _DreamWorld;

  factory DreamWorld.fromJson(Map<String, dynamic> json) =>
      _$DreamWorldFromJson(json);
}

@freezed
class Home with _$Home {
  const factory Home({
    required String frontDefault,
    required String frontFemale,
    required String frontShiny,
    required String frontShinyFemale,
  }) = _Home;

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);
}

@freezed
class OfficialArtwork with _$OfficialArtwork {
  const factory OfficialArtwork({
    required String frontDefault,
  }) = _OfficialArtwork;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);
}

@freezed
class Stat with _$Stat {
  const factory Stat({
    required int baseStat,
    required int effort,
    required StatInfo stat,
  }) = _Stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}

@freezed
class StatInfo with _$StatInfo {
  const factory StatInfo({
    required String name,
    required String url,
  }) = _StatInfo;

  factory StatInfo.fromJson(Map<String, dynamic> json) =>
      _$StatInfoFromJson(json);
}

@freezed
class Type with _$Type {
  const factory Type({
    required int slot,
    required TypeInfo type,
  }) = _Type;

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}

@freezed
class TypeInfo with _$TypeInfo