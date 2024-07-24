// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonApiModelImpl _$$PokemonApiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonApiModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      baseExperience: (json['base_experience'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toInt() ?? 0,
      weight: (json['weight'] as num?)?.toInt() ?? 0,
      order: (json['order'] as num?)?.toInt() ?? 0,
      isDefault: json['is_default'] as bool? ?? false,
      abilities: (json['abilities'] as List<dynamic>?)
              ?.map((e) => PokemonAbility.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PokemonAbility>[],
      types: (json['types'] as List<dynamic>?)
              ?.map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PokemonType>[],
      sprites: json['sprites'] == null
          ? const PokemonSprites(frontDefault: '', frontShiny: '')
          : _extractImage(json['sprites'] as Object),
      stats: (json['stats'] as List<dynamic>?)
              ?.map((e) => PokemonStat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PokemonStat>[],
      moves: (json['moves'] as List<dynamic>?)
              ?.map((e) => PokemonMove.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PokemonMove>[],
    );

Map<String, dynamic> _$$PokemonApiModelImplToJson(
        _$PokemonApiModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'order': instance.order,
      'is_default': instance.isDefault,
      'abilities': instance.abilities,
      'types': instance.types,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'moves': instance.moves,
    };

_$PokemonMoveImpl _$$PokemonMoveImplFromJson(Map<String, dynamic> json) =>
    _$PokemonMoveImpl(
      move: Move.fromJson(json['move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonMoveImplToJson(_$PokemonMoveImpl instance) =>
    <String, dynamic>{
      'move': instance.move,
    };

_$MoveImpl _$$MoveImplFromJson(Map<String, dynamic> json) => _$MoveImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$MoveImplToJson(_$MoveImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$PokemonAbilityImpl _$$PokemonAbilityImplFromJson(Map<String, dynamic> json) =>
    _$PokemonAbilityImpl(
      ability: Ability.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonAbilityImplToJson(
        _$PokemonAbilityImpl instance) =>
    <String, dynamic>{
      'ability': instance.ability,
    };

_$AbilityImpl _$$AbilityImplFromJson(Map<String, dynamic> json) =>
    _$AbilityImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$AbilityImplToJson(_$AbilityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$PokemonTypeImpl _$$PokemonTypeImplFromJson(Map<String, dynamic> json) =>
    _$PokemonTypeImpl(
      type: Type.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonTypeImplToJson(_$PokemonTypeImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

_$TypeImpl _$$TypeImplFromJson(Map<String, dynamic> json) => _$TypeImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$TypeImplToJson(_$TypeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$PokemonSpritesImpl _$$PokemonSpritesImplFromJson(Map<String, dynamic> json) =>
    _$PokemonSpritesImpl(
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
    );

Map<String, dynamic> _$$PokemonSpritesImplToJson(
        _$PokemonSpritesImpl instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_shiny': instance.frontShiny,
    };

_$PokemonStatImpl _$$PokemonStatImplFromJson(Map<String, dynamic> json) =>
    _$PokemonStatImpl(
      baseStat: (json['base_stat'] as num).toInt(),
      effort: (json['effort'] as num).toInt(),
      stat: StatDetail.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonStatImplToJson(_$PokemonStatImpl instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

_$StatDetailImpl _$$StatDetailImplFromJson(Map<String, dynamic> json) =>
    _$StatDetailImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$StatDetailImplToJson(_$StatDetailImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
