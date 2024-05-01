// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonImpl _$$PokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokemonImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      baseExperience: (json['baseExperience'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      isDefault: json['isDefault'] as bool,
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => PokemonAbility.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: PokemonSprites.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokemonStat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PokemonImplToJson(_$PokemonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'baseExperience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'order': instance.order,
      'isDefault': instance.isDefault,
      'abilities': instance.abilities,
      'types': instance.types,
      'sprites': instance.sprites,
      'stats': instance.stats,
    };

_$PokemonAbilityImpl _$$PokemonAbilityImplFromJson(Map<String, dynamic> json) =>
    _$PokemonAbilityImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PokemonAbilityImplToJson(
        _$PokemonAbilityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$PokemonTypeImpl _$$PokemonTypeImplFromJson(Map<String, dynamic> json) =>
    _$PokemonTypeImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PokemonTypeImplToJson(_$PokemonTypeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$PokemonSpritesImpl _$$PokemonSpritesImplFromJson(Map<String, dynamic> json) =>
    _$PokemonSpritesImpl(
      frontDefault: json['frontDefault'] as String,
      frontShiny: json['frontShiny'] as String,
      frontFemale: json['frontFemale'] as String,
      frontShinyFemale: json['frontShinyFemale'] as String,
      backDefault: json['backDefault'] as String,
      backShiny: json['backShiny'] as String,
      backFemale: json['backFemale'] as String,
      backShinyFemale: json['backShinyFemale'] as String,
    );

Map<String, dynamic> _$$PokemonSpritesImplToJson(
        _$PokemonSpritesImpl instance) =>
    <String, dynamic>{
      'frontDefault': instance.frontDefault,
      'frontShiny': instance.frontShiny,
      'frontFemale': instance.frontFemale,
      'frontShinyFemale': instance.frontShinyFemale,
      'backDefault': instance.backDefault,
      'backShiny': instance.backShiny,
      'backFemale': instance.backFemale,
      'backShinyFemale': instance.backShinyFemale,
    };

_$PokemonStatImpl _$$PokemonStatImplFromJson(Map<String, dynamic> json) =>
    _$PokemonStatImpl(
      baseStat: (json['baseStat'] as num).toInt(),
      effort: (json['effort'] as num).toInt(),
      stat: PokemonStatDetail.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonStatImplToJson(_$PokemonStatImpl instance) =>
    <String, dynamic>{
      'baseStat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

_$PokemonStatDetailImpl _$$PokemonStatDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonStatDetailImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PokemonStatDetailImplToJson(
        _$PokemonStatDetailImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
