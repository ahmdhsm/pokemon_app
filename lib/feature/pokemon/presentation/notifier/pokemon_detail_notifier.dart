import 'package:flutter/material.dart';
import 'package:pokemon_app/feature/pokemon/model/pokemon_model.dart';
import 'package:pokemon_app/feature/pokemon/usecases/pokemon_detail_usecase.dart';

class PokemonDetailNotifier extends ChangeNotifier {
  PokemonModel? pokemonDetail;

  Function? tes1;

  final _pokemonDetailUsecase = PokemonDetailUsecase();

  void getData(int id) async {
    var tes0 = await _pokemonDetailUsecase.getOfflinePokemonDetail(id);
    tes0.fold(
      (l) {},
      (r) async {
        pokemonDetail = r;
        notifyListeners();
      },
    );

    if (pokemonDetail != null) {
      return;
    }

    await Future.delayed(const Duration(milliseconds: 500));
    var tes = await _pokemonDetailUsecase.getPokemonDetail(id);
    tes.fold(
      (l) {},
      (r) async {
        pokemonDetail = r;
        notifyListeners();
      },
    );
  }
}
