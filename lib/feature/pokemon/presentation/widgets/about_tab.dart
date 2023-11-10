import 'package:flutter/material.dart';
import 'package:pokemon_app/core/extensions/string_extension.dart';
import 'package:pokemon_app/feature/pokemon/presentation/notifier/pokemon_detail_notifier.dart';
import 'package:pokemon_app/feature/pokemon/presentation/widgets/detail_row_widget.dart';
import 'package:pokemon_app/feature/pokemon/presentation/widgets/loading_circular_widget.dart';
import 'package:pokemon_app/main.dart';

class AboutTab extends StatelessWidget {
  AboutTab({super.key});

  final PokemonDetailNotifier _pokemonDetailNotifier = getIt.get();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pokemonDetailNotifier,
      builder: (context, child) {
        if (_pokemonDetailNotifier.pokemonDetail == null) {
          return const LoadingCircularWidget();
        } else {
          return Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 15,
            ),
            child: SingleChildScrollView(
              child: AnimatedBuilder(
                animation: _pokemonDetailNotifier,
                builder: (context, child) {
                  if (_pokemonDetailNotifier.pokemonDetail == null) {
                    return Container();
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          DetailRowWidget(
                            label: 'Species',
                            value: _pokemonDetailNotifier
                                .pokemonDetail!.pokemonDetailModel.species.name
                                .toCamelCase(),
                          ),
                          DetailRowWidget(
                            label: 'Height',
                            value: _pokemonDetailNotifier
                                .pokemonDetail!.pokemonDetailModel.height
                                .toString(),
                          ),
                          DetailRowWidget(
                            label: 'Weight',
                            value: _pokemonDetailNotifier
                                .pokemonDetail!.pokemonDetailModel.weight
                                .toString(),
                          ),
                          DetailRowWidget(
                            label: 'Abilities',
                            value: _pokemonDetailNotifier
                                .pokemonDetail!.pokemonDetailModel.abilities
                                .map((e) => e.ability.name)
                                .toList()
                                .join(', ')
                                .toCamelCase(),
                          ),
                          DetailRowWidget(
                            label: 'Egg Group',
                            value: _pokemonDetailNotifier.pokemonDetail!
                                .pokemonSpesiesDetailModel.eggGroups
                                .map((e) => e.name)
                                .toList()
                                .join(', ')
                                .toCamelCase(),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          );
        }
      },
    );
  }
}
