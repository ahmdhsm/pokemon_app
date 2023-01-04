import 'package:flutter/material.dart';
import 'package:pokemon_app/feature/pokemon/entities/pokemon_detail_entity.dart';

import '../../data/pokemon_detail_data.dart';

class PokemonDetailNotifier extends ChangeNotifier {
  PokemonDetailEntity? pokemonDetail;

  Function? tes1;

  void getData(int id) async {
    // await Future.delayed(Duration(seconds: 2));
    var tes = await PokemonDetailData().call(id);
    tes.fold(
      (l) {
        notifyListeners();
      },
      (r) async {
        await Future.delayed(Duration(seconds: 1));
        pokemonDetail = r;
        notifyListeners();
      },
    );
  }
}
