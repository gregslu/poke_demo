// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_api_model.freezed.dart';
part 'pokemon_api_model.g.dart';

@freezed
class PokemonApiModel with _$PokemonApiModel {
  const factory PokemonApiModel({
    @Default(0) int id,
    @Default('') String name,
    @JsonKey(name: 'base_experience') @Default(0) int baseExperience,
    @Default(0) int height,
    @Default(0) int weight,
    @Default(0) int order,
    @JsonKey(name: 'is_default') @Default(false) bool isDefault,
    @Default(<PokemonAbility>[]) List<PokemonAbility> abilities,
    @Default(<PokemonType>[]) List<PokemonType> types,
    @Default(PokemonSprites(frontDefault: '', frontShiny: ''))
    PokemonSprites sprites,
    @Default(<PokemonStat>[]) List<PokemonStat> stats,
    @Default(<PokemonMove>[]) List<PokemonMove> moves,
  }) = _PokemonApiModel;

  const PokemonApiModel._();

  factory PokemonApiModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonApiModelFromJson(json);

  bool get isEmpty => id == 0;
}

@freezed
class PokemonMove with _$PokemonMove {
  const factory PokemonMove({
    required Move move,
  }) = _PokemonMove;

  factory PokemonMove.fromJson(Map<String, Object?> json) =>
      _$PokemonMoveFromJson(json);
}

@freezed
class Move with _$Move {
  const factory Move({
    required String name,
    required String url,
  }) = _Move;

  factory Move.fromJson(Map<String, Object?> json) => _$MoveFromJson(json);
}

@freezed
class PokemonAbility with _$PokemonAbility {
  const factory PokemonAbility({
    required Ability ability,
  }) = _PokemonAbility;

  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);
}

@freezed
class Ability with _$Ability {
  const factory Ability({
    required String name,
    required String url,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
}

@freezed
class PokemonType with _$PokemonType {
  const factory PokemonType({
    required Type type,
  }) = _PokemonType;

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
}

@freezed
class Type with _$Type {
  const factory Type({
    required String name,
    required String url,
  }) = _Type;

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}

@freezed
class PokemonSprites with _$PokemonSprites {
  const factory PokemonSprites({
    @JsonKey(name: 'front_default') required String? frontDefault,
    @JsonKey(name: 'front_shiny') required String? frontShiny,
    backShinyFemale,
  }) = _PokemonSprites;

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);
}

@freezed
class PokemonStat with _$PokemonStat {
  const factory PokemonStat({
    @JsonKey(name: 'base_stat') required int baseStat,
    required int effort,
    required StatDetail stat,
  }) = _PokemonStat;

  factory PokemonStat.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatFromJson(json);
}

@freezed
class StatDetail with _$StatDetail {
  const factory StatDetail({
    required String name,
    required String url,
  }) = _StatDetail;

  factory StatDetail.fromJson(Map<String, dynamic> json) =>
      _$StatDetailFromJson(json);
}
