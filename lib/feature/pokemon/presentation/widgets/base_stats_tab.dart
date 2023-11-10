import 'package:flutter/material.dart';
import 'package:pokemon_app/core/extensions/string_extension.dart';
import 'package:pokemon_app/feature/pokemon/presentation/notifier/pokemon_detail_notifier.dart';
import 'package:pokemon_app/feature/pokemon/presentation/widgets/stat_row_widget.dart';
import 'package:pokemon_app/main.dart';

class BaseStatsTab extends StatelessWidget {
  BaseStatsTab({super.key});

  final PokemonDetailNotifier _pokemonDetailNotifier = getIt.get();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (var stat in _pokemonDetailNotifier
                .pokemonDetail!.pokemonDetailModel.stats)
              StatRowWidget(
                stat: stat.stat.name.baseStatLabel(),
                value: stat.baseStat,
              ),
          ],
        ),
      ),
    );
  }
}
