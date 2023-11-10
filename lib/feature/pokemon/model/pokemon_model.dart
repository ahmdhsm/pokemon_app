import 'package:pokemon_app/feature/pokemon/model/pokemon_detail_model.dart';

import 'package:pokemon_app/feature/pokemon/model/pokemon_spesies_detail_model.dart';

class PokemonModel {
  final PokemonDetailModel pokemonDetailModel;
  final PokemonSpesiesDetailModel pokemonSpesiesDetailModel;

  PokemonModel({
    required this.pokemonDetailModel,
    required this.pokemonSpesiesDetailModel,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      pokemonDetailModel: PokemonDetailModel.fromJson(
        json['pokemon_detail_model'],
      ),
      pokemonSpesiesDetailModel: PokemonSpesiesDetailModel.fromJson(
        json['pokemon_spesies_detail_model'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pokemon_detail_model': pokemonDetailModel.toJson(),
      'pokemon_spesies_detail_model': pokemonSpesiesDetailModel.toJson(),
    };
  }
}
