import 'package:flutter/material.dart';
import 'package:poke_demo/src/di.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initialize();
  runApp(const MyApp());
}
