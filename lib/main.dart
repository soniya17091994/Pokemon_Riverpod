import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_riverpod/model/pokemon.dart';
import 'package:pokemon_riverpod/screens/splash_screen.dart';
import 'package:pokemon_riverpod/themes/styles.dart';
import 'Providers/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  Hive.registerAdapter(PokemonAdapter());
  runApp(ProviderScope(child: Pokemon()));
}

class Pokemon extends StatelessWidget {
  const Pokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final themeNotifier = ref.watch(themeProvider);
      return MaterialApp(
        theme: Styles.themeData(themeNotifier.isDarkMode, context),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      );
    });
  }
}
