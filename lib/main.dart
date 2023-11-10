import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pokemon_app/feature/pokemon/presentation/notifier/pokemon_detail_notifier.dart';
import 'package:pokemon_app/feature/pokemon/presentation/notifier/pokemon_list_notifier.dart';
import 'package:pokemon_app/feature/pokemon/presentation/pages/pokemon_home.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton<PokemonListNotifier>(PokemonListNotifier());
  getIt.registerSingleton<PokemonDetailNotifier>(PokemonDetailNotifier());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      theme: ThemeData(
        textTheme: GoogleFonts.muktaTextTheme(),
      ),
      home: const PokemonHomePage(),
    );
  }
}
