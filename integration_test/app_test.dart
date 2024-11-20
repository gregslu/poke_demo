import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poke_demo/main.dart' as app;
import 'package:poke_demo/src/app.dart';
import 'package:poke_demo/src/pokemon/views/pages/pokemon_details_page.dart';
import 'package:poke_demo/src/pokemon/views/pages/pokemons_page.dart';
import 'package:poke_demo/src/pokemon/views/widgets/pokemon_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('App Test', () {
    testWidgets('Integration test', (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      app.main();
      // await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();
      expect(find.byType(MyApp), findsOneWidget);
      expect(find.byType(PokemonItem), findsOneWidget);
      await tester.tap(find.byKey(buttonAddKey));
      await tester.pumpAndSettle();
      expect(find.byType(PokemonItem), findsNWidgets(2));
      await tester.tap(find.byType(PokemonItem).first);
      await tester.pumpAndSettle();
      expect(find.byType(PokemonDetails), findsOneWidget);
      // await tester.tap(find.byTooltip('Back'));
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      expect(find.byType(PokemonDetails), findsNothing);
      expect(find.byType(PokemonsPage), findsOneWidget);
      await tester.tap(find.byKey(buttonRemoveKey));
      await tester.pumpAndSettle();
      expect(find.byType(PokemonItem), findsOneWidget);
      await tester.tap(find.byKey(buttonRemoveKey));
      await tester.pumpAndSettle();
      expect(find.byType(PokemonItem), findsNothing);

      // await tester.tap(finder)

      // Add more specific tests here, such as:
      // - Checking if certain widgets are present on the initial screen
      // - Navigating through the app
      // - Interacting with UI elements
    });
  });
}
