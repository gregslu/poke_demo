import 'package:dart_mappable/dart_mappable.dart';
import 'package:poke_demo/src/pokemon/models/data/pokemon_api_model.dart';

part 'pokemon_details_ui_state.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.equals)
class PokemonDetailsUiState with PokemonDetailsUiStateMappable {
  PokemonDetailsUiState({
    this.pokemon = const PokemonApiModel(),
    this.isLoading = false,
    this.errorMsg = '',
  });

  final String errorMsg;
  final bool isLoading;
  final PokemonApiModel pokemon;
}
