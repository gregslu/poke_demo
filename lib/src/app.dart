import 'package:context_watch/context_watch.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:poke_demo/src/pokemon/views/pages/pokemon_details_page.dart';
import 'package:poke_demo/src/pokemon/views/pages/pokemons_page.dart';

import 'di.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settingsController = di.settingsController;
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return ContextWatch.root(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',

            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            // The Mandy red, light theme.
            theme: FlexThemeData.light(
              scheme: FlexScheme.mandyRed,
              useMaterial3: true,
              pageTransitionsTheme: PageTransitionsTheme(
                builders:
                    Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
                  TargetPlatform.values,
                  value: (_) => const FadeForwardsPageTransitionsBuilder(),
                ),
              ),
            ),
            // The Mandy red, dark theme.
            darkTheme: FlexThemeData.dark(
              scheme: FlexScheme.mandyRed,
              // splashFactory: InkRipple.splashFactory,
              useMaterial3: true,
              pageTransitionsTheme: PageTransitionsTheme(
                builders:
                    Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
                  TargetPlatform.values,
                  value: (_) => const FadeForwardsPageTransitionsBuilder(),
                ),
              ),
            ),
            // Use dark or light theme based on system setting.
            themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return const SettingsView();
                    case PokemonDetails.routeName:
                      return const PokemonDetails();
                    case PokemonsPage.routeName:
                    default:
                      return const PokemonsPage();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
