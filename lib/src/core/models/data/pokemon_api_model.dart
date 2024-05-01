import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_api_model.freezed.dart';
part 'pokemon_api_model.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
    required String name,
    required int baseExperience,
    required int height,
    required int weight,
    required int order,
    required bool isDefault,
    required List<PokemonAbility> abilities,
    required List<PokemonType> types,
    required PokemonSprites sprites,
    required List<PokemonStat> stats,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}

@freezed
class PokemonAbility with _$PokemonAbility {
  const factory PokemonAbility({
    required String name,
    required String url,
  }) = _PokemonAbility;

  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);
}

@freezed
class PokemonType with _$PokemonType {
  const factory PokemonType({
    required String name,
    required String url,
  }) = _PokemonType;

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
}

@freezed
class PokemonSprites with _$PokemonSprites {
  const factory PokemonSprites({
    required String frontDefault,
    required String frontShiny,
    required String frontFemale,
    required String frontShinyFemale,
    required String backDefault,
    required String backShiny,
    required String backFemale,
    required String backShinyFemale,
  }) = _PokemonSprites;

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);
}

@freezed
class PokemonStat with _$PokemonStat {
  const factory PokemonStat({
    required int baseStat,
    required int effort,
    required PokemonStatDetail stat,
  }) = _PokemonStat;

  factory PokemonStat.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatFromJson(json);
}

@freezed
class PokemonStatDetail with _$PokemonStatDetail {
  const factory PokemonStatDetail({
    required String name,
    required String url,
  }) = _PokemonStatDetail;

  factory PokemonStatDetail.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatDetailFromJson(json);
}
