// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_api_model.freezed.dart';
part 'pokemon_api_model.g.dart';

@freezed
class PokemonApiModel with _$PokemonApiModel {
  const factory PokemonApiModel({
    required int id,
    required String name,
    @JsonKey(name: 'base_experience') required int baseExperience,
    required int height,
    required int weight,
    required int order,
    @JsonKey(name: 'is_default') required bool isDefault,
    required List<PokemonAbility> abilities,
    required List<PokemonType> types,
    required PokemonSprites sprites,
    required List<PokemonStat> stats,
  }) = _PokemonApiModel;

  factory PokemonApiModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonApiModelFromJson(json);
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
    @JsonKey(name: 'front_default') required String frontDefault,
    @JsonKey(name: 'front_shiny') required String frontShiny,
    @JsonKey(name: 'front_female') required String frontFemale,
    @JsonKey(name: 'front_shiny_female') required String frontShinyFemale,
    @JsonKey(name: 'back_default') required String backDefault,
    @JsonKey(name: 'back_shiny') required String backShiny,
    @JsonKey(name: 'back_female') required String backFemale,
    @JsonKey(name: 'back_shiny_female') required String backShinyFemale,
  }) = _PokemonSprites;

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);
}

@freezed
class PokemonStat with _$PokemonStat {
  const factory PokemonStat({
    @JsonKey(name: 'base_stat') required int baseStat,
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
