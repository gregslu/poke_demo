import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_demo/src/settings/settings_controller.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await container.read(settingsControllerProvider).loadSettings();
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}
