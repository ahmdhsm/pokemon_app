import 'package:flutter/material.dart';
import 'package:pokemon_app/feature/pokemon/presentation/notifier/pokemon_detail_notifier.dart';
import 'package:pokemon_app/feature/pokemon/presentation/widgets/pokemon_type_widget.dart';
import 'package:pokemon_app/main.dart';

class MovesTab extends StatelessWidget {
  final PokemonDetailNotifier _pokemonDetailNotifier = getIt.get();

  MovesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pokemonDetailNotifier,
      builder: (context, child) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Wrap(
              children: [
                for (int i = 0;
                    i <
                        _pokemonDetailNotifier
                            .pokemonDetail!.pokemonDetailModel.moves.length;
                    i++)
                  PokemonTypeWidget(
                    type: _pokemonDetailNotifier
                        .pokemonDetail!.pokemonDetailModel.moves[i].move.name,
                    index: i,
                    withAnimation: false,
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
