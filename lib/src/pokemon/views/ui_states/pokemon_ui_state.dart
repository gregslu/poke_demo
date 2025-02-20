import 'package:dart_mappable/dart_mappable.dart';
import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';

part 'pokemon_ui_state.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.equals)
class PokemonUiState with PokemonUiStateMappable {
  PokemonUiState({
    List<PokemonApiModel> pokemon = const [],
    this.isLoading = false,
    this.errorMsg = '',
  }) : pokemon = List.unmodifiable(pokemon);

  final String errorMsg;
  final bool isLoading;
  final List<PokemonApiModel> pokemon;
}
